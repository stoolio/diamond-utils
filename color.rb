module Grades
  class BadColor < StandardError; end
  Color::VALID.each do |color|
    const_set(color, Color.new(color))
  end

  class Color
    include Comparable

    VALID = %i(D E F G H I J K L M N)

    attr_reader :color

    def initialize(color)
      self.color = color
    end

    def color=(color)
      normalized_color = color.to_s[0].upcase.to_sym
      @color = normalized_color if VALID.include?(normalized_color)
    end

    def -(other)
      fail NotSupported unless other.class == Color
      ColorRange.new(color, other)
    end

    def to_s
      color.to_s
    end

    def <=>(other)
      -1 * (color <=> other.color)
    end

    def succ
      Color.new(VALID[VALID.find_index(color) + 1])
    end
  end

  class ColorRange < Range
    def to_s
      "#{self.begin}-#{self.end}"
    end
  end
end
