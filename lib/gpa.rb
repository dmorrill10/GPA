require "gpa/version"
require "gpa/course"

require 'dmorrill10-utils/enumerable'
require 'yaml'

module YAML
  # Load the document contained in +filename+.  Returns the yaml contained in
  # +filename+ as a ruby object
  def self.load_stream_from_file filename
    File.open(filename, 'r:bom|utf-8') { |f| self.load_stream f, filename }
  end
end

class Array
  # @param [Integer] num_most_recent_units
  # @returns [Numeric] The GPA calculated with +num_most_recent_units+ most recent units completed.
  def gpa(num_most_recent_units=units_completed)
    courses = reject do |course| 
      !course.respond_to?(:grade_points) || course.grade_points.nil?
    end.sort_courses_by_date_completed.inject([]) do |accum_array, course|
      accum_array << course
      break accum_array if accum_array.units_completed >= num_most_recent_units
      accum_array
    end

    courses.map { |course| course.grade_points }.sum / courses.units_completed.to_f
  end

  def units_completed
    completed_courses.map do |course|
      course.units
    end.sum
  end

  def sort_courses_by_date_completed
    completed_courses.sort do |c1, c2| 
      c2.date_completed <=> c1.date_completed
    end
  end

  def completed_courses
    current_date = DateTime.now
    select do |course| 
      course.respond_to?(:date_completed) &&
      course.date_completed < current_date &&
      !course.grade.nil?
    end
  end
end

module Gpa
  def self.load_courses_from_file(yaml_file_path)
    YAML.load_stream_from_file(yaml_file_path)
  end
end
