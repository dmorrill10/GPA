# Spec helper (must include first to track code coverage with SimpleCov)
require_relative 'support/spec_helper'

require_relative '../lib/gpa/course'

ExpectedCourse = Struct.new(
  :subject,
  # @returns [Integer]
  :number,
  # @returns [String]
  :name,
  # @returns [String]
  :grade,
  # @returns [Integer]
  :units,
  # @returns [Date]
  :date_completed,
  # @returns [String]
  :faculty,
  # @returns [Numeric]
  :grade_points
)
describe Gpa::Course do
  it "should initialize properly" do
    @expected_course = ExpectedCourse.new(
      "WRS",
      123,
      "C4 Name",
      "B",
      2,
      Date.parse('2008-12-01'),
      'Arts',
      6.0
    )
    @patient = Gpa::Course.new(
      @expected_course.subject,
      @expected_course.number,
      @expected_course.name,
      @expected_course.grade,
      @expected_course.units,
      @expected_course.date_completed,
      @expected_course.faculty
    )

    check_patient
  end

  def check_patient
    @patient.subject.must_equal @expected_course.subject
    @patient.number.must_equal @expected_course.number
    @patient.name.must_equal @expected_course.name
    @patient.grade.must_equal @expected_course.grade
    @patient.units.must_equal @expected_course.units
    @patient.date_completed.must_equal @expected_course.date_completed
    @patient.faculty.must_equal @expected_course.faculty
    @patient.grade_points.must_equal @expected_course.grade_points
  end
end