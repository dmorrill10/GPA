# @todo Move to utils
class Object
  def to_h
    Hash[instance_variables.map do |var| 
      [var[1..-1].to_sym, instance_variable_get(var)]
    end]
  end
end

class String
  # @returns [Numeric] Number of grade points for this grade
  def points
    Course::UNIVERSITY_OF_ALBERTA_GRADE_TO_POINTS[self]
  end
end

class Course
  # @return [Hash<String, Numeric>] University of Alberta grade to grade points hash.  
  UNIVERSITY_OF_ALBERTA_GRADE_TO_POINTS = {
    'A+' => 4.0,
    'A' => 4.0,
    'A-' => 3.7,
    'B+' => 3.3,
    'B' => 3.0,
    'B-' => 2.7,
    'C+' => 2.3,
    'C' => 2.0,
    'C-' => 1.7,
    'D+' => 1.3,
    'D' => 1.0,
    'F' => 0.0
  }

  # @todo Incomplete list of subjects. Not a big deal though because faculty can be specified on a per course basis.
  # @return [Hash<String, Array<String>>] University of Alberta subject hierarchy.
  UNIVERSITY_OF_ALBERTA_SUBJECT_HIERARCHY = {
    'ALES' => [
      # Agricultural and Resource Economics 
      'AREC',
      # Agricultural, Food and Nutritional Science 
      'AFNS',
      # Agricultural, Life and Environmental Sciences 
      'ALES',
      # Animal Science 
      'AN SC',
      # Environmental and Conservation Sciences 
      'ENCS',
      # Forest Economics 
      'FOREC',
      # Forest Engineering 
      'FOREN',
      # Forest Science 
      'FOR',
      # Human Ecology 
      'HECOL',
      # Interdisciplinary Courses 
      'INT D',
      # Nutrition 
      'NUTR',
      # Nutrition and Food Sciences 
      'NU FS',
      # Plant Science 
      'PL SC',
      # Renewable Resources 
      'REN R',
      # Rural Sociology 
      'R SOC',
      # Soil Science 
      'SOILS',
      # University 
      'UNIV',
      # Work Experience 
      'WKEXP'
    ],
    'Arts' => [
      'ANTHR',
      'ART H',
      'ART',
      'DES',
      'DRAMA',
      'ECON',
      'ENGL',
      'FS',
      'HIST',
      'POL S',
      'RELIG',
      'WRITE',
      'WRS',
      'LING',
      'CLASS',
      'GREEK',
      'LATIN',
      'MUSIC',
      'PHIL',
      # 'PSYCO', Must be specified per course since could be art or science
      'SOC',
      'CSL',
      'C LIT',
      'INT D',
      'W ST'
    ],
    'Science' => [
      # Astronomy 
      'ASTRO',
      # Biochemistry (taught by the Faculty of Medicine and Dentistry) 
      'BIOCH',
      # Biochimie (Faculté Saint-Jean) 
      'BIOCM',
      # Biological Science - Biology 
      'BIOL',
      # Biological Science - Botany 
      'BOT',
      # Biological Science - Entomology 
      'ENT',
      # Biological Science - Genetics 
      'GENET',
      # Biological Science - Microbiology 
      'MICRB',
      # Biological Science - Zoology 
      'ZOOL',
      # Biologie (Faculté Saint-Jean) 
      'BIOLE',
      # Cell Biology (taught by the Faculty of Medicine and Dentistry) 
      'CELL',
      # Chemistry 
      'CHEM',
      # Chimie (Faculté Saint-Jean) 
      'CHIM',
      # Computing Science 
      'CMPUT',
      # Earth and Atmospheric Sciences [formerly Geography and Geology 
      'EAS',
      # Environmental Physical Sciences 
      'ENVPS',
      # Geophysics 
      'GEOPH',
      # Immunology and Infection 
      'IMIN',
      # Laboratory Animal Management 
      'LB AN',
      # Marine Science 
      'MA SC',
      # Mathematical Physics 
      'MA PH',
      # Mathematics 
      'MATH',
      # Mathématiques (Faculté Saint-Jean)
      'MATHQ',
      # Neuroscience (taught by the Faculty of Medicine and Dentistry) 
      'NEURO',
      # Paleontology 
      'PALEO',
      # Pharmacology (taught by the Faculty of Medicine and Dentistry) 
      'PMCOL',
      # Physiology (taught by the Faculty of Medicine and Dentistry) 
      'PHYSL',
      # Physics 
      'PHYS',
      # Physique (Faculté Saint-Jean) 
      'PHYSQ',
      # Psychology 
      # 'PSYCO', Must be specified per course since could be art or science
      # Sciences de la Terre et de l'atmosphére (Faculté Saint-Jean) 
      'SCTA',
      # Statistics 
      'STAT',
      # Statistique (Faculté Saint-Jean)
      'STATQ'
    ]

  }
  attr_reader(
    # @returns [String]
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
    :faculty
  )
# @todo thing-to-do
  def initialize(
    subject, 
    number,
    name,
    grade,
    units,
    date_completed,
    faculty=nil
  )
    @subject = subject
    @number = number
    @name = name
    @grade = grade
    @units = units
    @date_completed = date_completed
    @faculty = if faculty.nil?
      UNIVERSITY_OF_ALBERTA_SUBJECT_HIERARCHY[@subject]
    else
      faculty
    end
  end

  def grade_points
    return nil if @grade.nil?
    
    @units * @grade.points
  end
end