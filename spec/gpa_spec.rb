# Spec helper (must include first to track code coverage with SimpleCov)
require_relative 'support/spec_helper'

require_relative '../lib/gpa'

describe Gpa::CourseArray do
  it "should load courses from a YAML file properly" do
    Gpa::CourseArray.load_courses_from_file(TEST_COURSES_FILE).each_with_index do |course, i|
      {
        subject: course.subject,
        number: course.number,
        name: course.name,
        grade: course.grade,
        units: course.units,
        date_completed: course.date_completed
      }.must_equal EXPECTED_COURSES_IN_HASH_FORM_FROM_COURSES_FILE[i]
    end
  end

  describe 'should calculate the gpa of all courses inside itself' do
    it "for all courses" do
      Gpa::CourseArray.load_courses_from_file(TEST_COURSES_FILE).gpa.must_equal 3.669696969696969
    end
    it "for a specified number of most recent courses" do
      Gpa::CourseArray.load_courses_from_file(TEST_COURSES_FILE).gpa(60).must_equal 3.9550000000000014
    end
  end
end