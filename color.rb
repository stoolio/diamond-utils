module Diamond
  module Grades
    class GradesError < StandardError; end

    def self.Color(color)
      Color.get(color)
    end

    module Color
      class ColorError < Grades::GradesError; end
      class NotAColor < ColorError; end
      class InvalidColor < ColorError; end

      VALID = (:D..:Z).to_a

      def self.normalize(name)
        normalized_name = name.to_s.chr.upcase.to_sym
        fail InvalidColor unless VALID.include?(normalized_name)
        normalized_name
      end

      def self.get(color)
        const_get(normalize(color))
      end

      class ColorGrade
        include Comparable

        def -(other)
          fail NotAColor unless other.class == ColorGrade
          ColorRange.new(self, other)
        end

        def to_s
          color.to_s
        end

        def inspect
          "#{color} Color"
        end

        def <=>(other)
          -1 * (color <=> other.color)
        end

        def succ
          Color.get(VALID[VALID.index(color) + 1])
        end

        protected

        attr_reader :color

        private

        def initialize(color)
          @color = Color.normalize(color)
        end
      end

      Color::VALID.each do |color|
        const_set(color, ColorGrade.send(:new, color))
      end

      class ColorRange < Range
        def to_s
          "#{first}-#{last}"
        end

        def inspect
          "#{first.inspect}-#{last.inspect}"
        end
      end
    end
  end
end

class Colors
  include Diamond::Grades::Color
  def self.init
    D
  end
end
