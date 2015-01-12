
require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

TEST_COURSES_FILE = File.expand_path('../courses.yml', __FILE__)
EXPECTED_COURSES_IN_HASH_FORM_FROM_COURSES_FILE = [
  {
             :subject => "BIOL",
              :number => 659,
                :name => "BIOL Course name",
               :grade => "B",
               :units => 27,
      :date_completed => Date.parse('2008-12-01')
  },
  {
             :subject => "PHYS",
              :number => 222,
                :name => "Course name",
               :grade => "A-",
               :units => 3,
      :date_completed => Date.parse('2009-09-01')
  },
  {
             :subject => "ECON",
              :number => 175,
                :name => "Course name",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2009-12-01')
  },
  {
             :subject => "ECON",
              :number => 272,
                :name => "Course name",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2009-12-01')
  },
  {
             :subject => "DRAMA",
              :number => 297,
                :name => "Course name",
               :grade => "B+",
               :units => 3,
      :date_completed => Date.parse('2009-12-01')
  },
  {
             :subject => "MATH",
              :number => 120,
                :name => "Course name",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2009-12-01')
  },
  {
             :subject => "ECON",
              :number => 201,
                :name => "Course name",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2010-09-01')
  },
  {
             :subject => "ECON",
              :number => 209,
                :name => "Course name",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2010-09-01')
  },
  {
             :subject => "ECON",
              :number => 229,
                :name => "Course name",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2010-09-01')
  },
  {
             :subject => "ENGL",
              :number => 125,
                :name => "Course name",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2010-09-01')
  },
  {
             :subject => "PHIL",
              :number => 215,
                :name => "Course name",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2010-09-01')
  },
  {
             :subject => "PHIL",
              :number => 265,
                :name => "Course name",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2010-08-01')
  },
  {
             :subject => "ECON",
              :number => 325,
                :name => "Course name",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2010-12-01')
  },
  {
             :subject => "ECON",
              :number => 366,
                :name => "Course name",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2010-12-01')
  },
  {
             :subject => "MATH",
              :number => 219,
                :name => "Course name",
               :grade => "A-",
               :units => 3,
      :date_completed => Date.parse('2010-12-01')
  },
  {
             :subject => "MATH",
              :number => 225,
                :name => "Course name",
               :grade => "A-",
               :units => 3,
      :date_completed => Date.parse('2010-12-01')
  },
  {
             :subject => "STAT",
              :number => 265,
                :name => "Course name",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2010-12-01')
  },
  {
             :subject => "ECON",
              :number => 379,
                :name => "Course name",
               :grade => "A-",
               :units => 3,
      :date_completed => Date.parse('2011-09-01')
  },
  {
             :subject => "ECON",
              :number => 396,
                :name => "Course name",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2011-09-01')
  },
  {
             :subject => "ECON",
              :number => 912,
                :name => "Course name",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2011-09-01')
  },
  {
             :subject => "STAT",
              :number => 266,
                :name => "Course name",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2011-09-01')
  },
  {
             :subject => "ECON",
              :number => 399,
                :name => "Course name",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2011-08-01')
  },
  {
             :subject => "ECON",
              :number => 900,
                :name => "Course name",
               :grade => "N/A",
               :units => 3,
      :date_completed => Date.parse('2012-12-01')
  },
  {
             :subject => "ECON",
              :number => 918,
                :name => "Course name",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2012-12-01')
  },
  {
             :subject => "ECON",
              :number => 695,
                :name => "Course name",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2012-12-01')
  },
  {
             :subject => "STAT",
              :number => 699,
                :name => "Course name",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2012-12-01')
  }
]
