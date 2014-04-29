# Makes working with diamond information easier
module Diamond
  shapes = %w(
    Round
    Pear
    Princess
    Marquise
    Oval
    Radiant
    Emerald
    Heart
    Cushion
    Asscher
  )

  clarity = %w(IF VVS1 VVS2 VS1 VS2 SI1 SI2 SI3)

  cut = %w(Excellent Very_Good Good Fair)

  polish = %w(Excellent Very_Good Good Fair)

  symmetry = %w(Excellent Very_Good Good Fair)

  labs = %w(GIA', 'IGI', 'AGS', 'HRD', 'EGL_USA', 'NONE')

  # price_total_from/to - integer

  # page_number - integer

  # page_size - integer

  # size_from/ to - decimal - e.g. 2.10

  sort_by = %w(PRICE SHAPE SIZE COLOR CLARITY CUT LAB)

  sort_direction = %w(ASC DESC)

  def stupid
    a = shapes + clarity + cut
    b = polish + symmetry + labs + sort_by + sort_direction
    a + b
  end

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
      ORDER[abbr] <=> ORDER[other.abbr]
    end
  end
end
