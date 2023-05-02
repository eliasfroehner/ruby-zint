module Zint
  module Structs
    class VectorString < FFI::Struct
      layout :x, :float, # x, y position relative to halign
        :y, :float,
        :fsize, :float, # font size
        :width, :float, # Suggested string width, may be 0 if none recommended
        :length, :int, # Number of characters
        :rotation, :int, # 0, 90, 180, 270 degrees
        :halign, :int, # Horizontal alignment: 0 for centre, 1 for left, 2 for right (end)
        :text, :pointer, # the text string to be printed
        :next, VectorString.by_ref # Pointer to next string

      # x position relative to halign
      def x
        self[:x]
      end

      # y position
      def y
        self[:y]
      end

      # font size
      def fsize
        self[:fsize]
      end

      # Suggested string width, may be 0 if none recommended
      def width
        self[:width]
      end

      # 0, 90, 180, 270 degrees
      def rotation
        self[:rotation]
      end

      # Horizontal alignment: 0 for centre, 1 for left, 2 for right (end)
      def halign
        self[:halign]
      end

      # the text string to be printed
      def text
        self[:text].read_bytes(self[:length])
      end
    end
  end
end
