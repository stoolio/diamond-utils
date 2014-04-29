module Diamond
  module Grades
    module Cut # These grades are also used for Polish & Symmetry
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

      class CutGrade
        include Comparable

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
  end
end
