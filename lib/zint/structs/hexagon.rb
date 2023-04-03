module Zint
  module Structs
    class Hexagon < FFI::Struct
      layout :x, :float,
        :y, :float,
        :diameter, :float,
        :rotation, :int,
        :next, :pointer
    end
  end
end
