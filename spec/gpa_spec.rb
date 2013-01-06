# Spec helper (must include first to track code coverage with SimpleCov)
require_relative 'support/spec_helper'

require_relative '../lib/gpa'

require 'dmorrill10-utils/object'

describe Gpa do  
  it "should load courses from a YAML file properly" do
    Gpa.load_courses_from_file(TEST_COURSES_FILE).map do |course|
      course.to_h
    end.must_equal EXPECTED_COURSES_IN_HASH_FORM_FROM_COURSES_FILE
  end
end

describe Array do
  describe 'should calculate the gpa of all courses inside itself' do
    it "for all courses" do
      Gpa.load_courses_from_file(TEST_COURSES_FILE).gpa.must_equal 362/99.to_r
    end
    it "for a specified number of most recent courses" do
      Gpa.load_courses_from_file(TEST_COURSES_FILE).gpa(60).must_equal 3.95
    end
  end
end