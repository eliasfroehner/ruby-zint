module Zint
  module Structs
    class Rect < FFI::Struct
      layout :x, :float,
        :y, :float,
        :height, :float,
        :width, :float,
        :colour, :int,
        :next, :pointer
    end
  end
end
