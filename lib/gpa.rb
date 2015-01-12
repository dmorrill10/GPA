require_relative "gpa/version"
require_relative "gpa/course"
require 'yaml'

module Gpa
  class CourseArray < Array
    def self.load_courses_from_file(yaml_file_path)
      load_yaml_from_file(yaml_file_path).inject(new) do |new_instance, yaml_course|
        new_instance << Course.from_hash(yaml_course)
      end
    end

    # @param [Integer] num_most_recent_units
    # @returns [Numeric] The GPA calculated with +num_most_recent_units+ most recent units completed.
    def gpa(num_most_recent_units = units_completed)
      courses = sort_courses_by_date_completed.inject(CourseArray.new) do |accum_array, course|
        next accum_array unless course.grade_has_points?
        accum_array << course
        break accum_array if accum_array.units_completed >= num_most_recent_units
        accum_array
      end

      courses.inject(0) do |sum, course|
        sum += course.grade_points / courses.units_completed.to_f
      end
    end

    def units_completed
      completed_courses.inject(0) do |sum, course|
        sum += course.units
      end
    end

    def sort_courses_by_date_completed
      self.class().new(
        completed_courses.sort do |c1, c2|
          c2.date_completed <=> c1.date_completed
        end
      )
    end

    def completed_courses
      current_date = DateTime.now
      select do |course|
        course.respond_to?(:date_completed) &&
        course.date_completed < current_date &&
        !course.grade.nil?
      end
    end

    private

    # Load the document contained in +filename+.  Returns the yaml contained in
    # +filename+ as a ruby object
    def self.load_yaml_from_file(filename)
      File.open(filename, 'r:bom|utf-8') { |f| YAML.load_stream f, filename }
    end
  end
end
