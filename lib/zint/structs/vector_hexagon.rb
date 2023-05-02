module Zint
  module Structs
    class VectorHexagon < FFI::Struct
      layout :x, :float,
        :y, :float,
        :diameter, :float,
        :rotation, :int,  # 0, 90, 180, 270 degrees
        :next, VectorHexagon.by_ref # Pointer to next hexagon

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

      # 0, 90, 180, 270 degrees
      def rotation
        self[:rotation]
      end
    end
  end
end
