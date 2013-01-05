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

describe Course do
  it "should initialize properly" do
    @expected_course = ExpectedCourse.new(
             :subject => "WRS",
              :number => 101,
                :name => "Exploring Writing",
               :grade => "B",
               :units => 27,
      :date_completed => Date.parse('2008-12-01'),
      :faculty => 'Arts',
      :grade_points => 9.0
    )
    @patient = Course.new(
      @expected_course.subject, 
      @expected_course.number,
      @expected_course.name,
      @expected_course.grade,
      @expected_course.units,
      @expected_course.date_completed
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