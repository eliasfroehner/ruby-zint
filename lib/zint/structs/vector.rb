module Zint
  module Structs
    class Vector < FFI::Struct
      layout :width, :float,
        :height, :float,
        :rectangles, :pointer,
        :hexagons, :pointer,
        :strings, :pointer,
        :circles, :pointer
    end
  end
end
