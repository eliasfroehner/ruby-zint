module Zint
  module Structs
    class VectorRect < FFI::Struct
      layout :x, :float,
        :y, :float,
        :height, :float,
        :width, :float,
        :colour, :int, # -1 for foreground, 1-8 for Cyan, Blue, Magenta, Red, Yellow, Green, Black, White
        :next, VectorRect.by_ref # Pointer to next rectangle

      # x position
      def x
        self[:x]
      end

      # y position
      def y
        self[:y]
      end

      # height
      def height
        self[:height]
      end

      # width
      def width
        self[:width]
      end

      # -1 for foreground, 1-8 for Cyan, Blue, Magenta, Red, Yellow, Green, Black, White
      def colour
        self[:colour]
      end
    end
  end
end
