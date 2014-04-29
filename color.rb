module Diamond
  class Error < StandardError; end

  def self.Color(color)
    Color.get(color)
  end

  module Color
    class Error < Diamond::Error; end
    class NotAColor < Error; end
    class InvalidColor < Error; end

    VALID = (:D..:Z).to_a

    def self.normalize(name)
      normalized_name = name.to_s.chr.upcase.to_sym
      fail InvalidColor unless VALID.include?(normalized_name)
      normalized_name
    end

    def self.get(color)
      const_get(normalize(color))
    end

    class Grade
      include Comparable

      def initialize(color)
        @color = Color::VALID.index(Color.normalize(color))
      end

      def -(other)
        fail NotAColor unless other.class == Grade
        ColorRange.new(self, other)
      end

      def to_s
        Color::VALID[color].to_s
      end

      def inspect
        "#{self} Color"
      end

      def >(other)
        !(color > other.color)
      end

      def <(other); !self.>(other); end

      def <=>(other)
        color <=> other.color
      end

      def succ
        Color.get(Color::VALID[color.succ])
      end

      protected

      attr_reader :color
    end

    Color::VALID.each do |color|
      const_set(color, Grade.send(:new, color))
    end

    COLORLESS = D - F

    NEAR_COLORLESS = G - J

    FAINT_YELLOW = K - M

    class ColorRange < Range
      def to_s
        "#{first}-#{last}"
      end
    end
  end
end

# Examples

# D = Diamond::Color::D
# G = Diamond::Color::G

# class Diamonds
#   include Diamond::Color
#   def the_best_color
#     D
#   end
# end

# D-G for ranges
# they only work one way, as Ruby ranges are wont to do
