module Zint
  module Structs
    class VectorCircle < FFI::Struct
      layout :x, :float,
        :y, :float,
        :diameter, :float,
        :colour, :int,  #  Non-zero for draw with background colour
        :next, VectorCircle.by_ref #  Pointer to next circle

      # x position
      def x
        self[:x]
      end

      # y position
      def y
        self[:y]
      end

      # diameter
      def diameter
        self[:diameter]
      end

      #  Non-zero for draw with background colour
      def colour
        self[:colour]
      end
    end
  end
end
