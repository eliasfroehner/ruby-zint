module Zint
  module Structs
    class Circle < FFI::Struct
      layout :x, :float,
        :y, :float,
        :diameter, :float,
        :colour, :int,
        :next, :pointer
    end
  end
end
