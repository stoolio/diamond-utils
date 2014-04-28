module Diamond

  shapes = [
    'Round',
    'Pear',
    'Princess',
    'Marquise',
    'Oval',
    'Radiant',
    'Emerald',
    'Heart',
    'Cushion',
    'Asscher'
  ]

  # size_from/ to - decimal - e.g. 2.10
  class Color
    include Comparable

    VALID = [:D, :E, :F, :G, :H, :I, :J, :K, :L, :M, :N]
    attr_reader :color

    def color=(color)
      normalized_color = color.to_s[0].upcase.to_sym
      @color =  normalized_color if VALID.include?(normalized_color)
    end

    def <=>(other)
      -1 * (color <=> other.color)
    end

    def succ
      Color.new(VALID[VALID.find_index(@color) - 1])
    end

    def initialize(color)
      self.color = color
    end

  end

  clarity = ['IF', 'VVS1', 'VVS2', 'VS1', 'VS2', 'SI1', 'SI2', 'SI3']

  cut = ['Excellent', 'Very Good', 'Good', 'Fair']

  polish = ['Excellent', 'Very Good', 'Good', 'Fair']

  symmetry = ['Excellent', 'Very Good', 'Good', 'Fair']

  class CutGrade
    include Comparable

    PRETTY_NAMES = {
      EX: 'Excellent',
      VG: 'Very Good',
      G:  'Good',
      F:  'Fair',
      P:  'Poor'
    }

    ORDER = {
      EX: 5,
      VG: 4,
      G:  3,
      F:  2,
      P:  1
    }

    attr_reader :grade

    def valid?(val)
      PRETTY_NAMES.keys.include?(val)
    end

    def grade
      PRETTY_NAMES.fetch(@grade)
    end

    def abbr
      @grade
    end

    def grade=(grade)
      normalized_grade = grade.upcase.split(' ').map{|s|s[0]}.join.to_sym
      @grade = normalized_grade if valid?(normalized_grade)
    end

    def <=>(other)
      ORDER[self.abbr] <=> ORDER[other.abbr]
    end
  end

  labs = ['GIA', 'IGI', 'AGS', 'HRD', 'EGL_USA', 'NONE']

  # price_total_from/to - integer

  # page_number - integer

  # page_size - integer

  sort_by = ['PRICE','SHAPE','SIZE','COLOR', 'CLARITY', 'CUT','LAB']

  sort_direction = 'ASC','DESC'

end
