
require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

TEST_COURSES_FILE = File.expand_path('../courses.yml', __FILE__)
EXPECTED_COURSES_IN_HASH_FORM_FROM_COURSES_FILE = [
  {
             :subject => "WRS",
              :number => 101,
                :name => "Exploring Writing",
               :grade => "B",
               :units => 27,
      :date_completed => Date.parse('2008-12-01')
  },
  {
             :subject => "SCI",
              :number => 100,
                :name => "Integrated Science",
               :grade => "A-",
               :units => 3,
      :date_completed => Date.parse('2009-04-01')
  },
  {
             :subject => "CMPUT",
              :number => 175,
                :name => "Intro to Foundations of Computing II",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2009-12-01')
  },
  {
             :subject => "CMPUT",
              :number => 272,
                :name => "Formal Systems and Logic",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2009-12-01')
  },
  {
             :subject => "DRAMA",
              :number => 247,
                :name => "Intro to Oral Communication",
               :grade => "B+",
               :units => 3,
      :date_completed => Date.parse('2009-12-01')
  },
  {
             :subject => "MATH",
              :number => 120,
                :name => "Basic Linear Algebra I",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2009-12-01')
  },
  {
             :subject => "CMPUT",
              :number => 201,
                :name => "Practical Programming Methodology",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2010-04-01')
  },
  {
             :subject => "CMPUT",
              :number => 204,
                :name => "Algorithms I",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2010-04-01')
  },
  {
             :subject => "CMPUT",
              :number => 229,
                :name => "Computer Organization and Architecture I",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2010-04-01')
  },
  {
             :subject => "ENGL",
              :number => 125,
                :name => "Aboriginal Writing",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2010-04-01')
  },
  {
             :subject => "PHIL",
              :number => 215,
                :name => "Epistemology",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2010-04-01')
  },
  {
             :subject => "PHIL",
              :number => 265,
                :name => "Philosophy of Science",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2010-08-01')
  },
  {
             :subject => "CMPUT",
              :number => 325,
                :name => "Non-procedural Programming Languages",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2010-12-01')
  },
  {
             :subject => "CMPUT",
              :number => 366,
                :name => "Intelligent Systems",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2010-12-01')
  },
  {
             :subject => "MATH",
              :number => 214,
                :name => "Intermediate Calculus I",
               :grade => "A-",
               :units => 3,
      :date_completed => Date.parse('2010-12-01')
  },
  {
             :subject => "MATH",
              :number => 225,
                :name => "Linear Algebra II",
               :grade => "A-",
               :units => 3,
      :date_completed => Date.parse('2010-12-01')
  },
  {
             :subject => "STAT",
              :number => 265,
                :name => "Statistics I",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2010-12-01')
  },
  {
             :subject => "CMPUT",
              :number => 379,
                :name => "Operating System Concepts",
               :grade => "A-",
               :units => 3,
      :date_completed => Date.parse('2011-04-01')
  },
  {
             :subject => "CMPUT",
              :number => 396,
                :name => "Topics in Computing Science: Design and Development of Mobile Search and Navigation Application",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2011-04-01')
  },
  {
             :subject => "CMPUT",
              :number => 412,
                :name => "Experimental mobile robotics",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2011-04-01')
  },
  {
             :subject => "STAT",
              :number => 266,
                :name => "Statistics II",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2011-04-01')
  },
  {
             :subject => "CMPUT",
              :number => 399,
                :name => "Topics in Computing Science: Object-Oriented Programming for Web Applications",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2011-08-01')
  },
  {
             :subject => "CMPUT",
              :number => 400,
                :name => "Industrial Internship Practicum",
               :grade => nil,
               :units => 3,
      :date_completed => Date.parse('2012-12-01')
  },
  {
             :subject => "CMPUT",
              :number => 418,
                :name => "Numerical Methods I",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2012-12-01')
  },
  {
             :subject => "CMPUT",
              :number => 466,
                :name => "Machine Learning",
               :grade => "A+",
               :units => 3,
      :date_completed => Date.parse('2012-12-01')
  },
  {
             :subject => "STAT",
              :number => 371,
                :name => "Probability and Stochastic Processes",
               :grade => "A",
               :units => 3,
      :date_completed => Date.parse('2012-12-01')
  }
]
