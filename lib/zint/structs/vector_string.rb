module Zint
  module Structs
    class VectorString < FFI::Struct
      layout :x, :float,
        :y, :float,
        :fsize, :float,
        :width, :float,
        :length, :int,
        :rotation, :int,
        :halign, :int,
        :text, :pointer,
        :next, :pointer
    end
  end
end
