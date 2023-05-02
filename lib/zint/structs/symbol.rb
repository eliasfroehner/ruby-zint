module Zint
  module Structs
    class Symbol < FFI::ManagedStruct
      layout :symbology, :int,
        :height, :float,
        :whitespace_width, :int,
        :whitespace_height, :int,
        :border_width, :int,
        :output_options, :int,
        :fgcolour, [:char, 10],
        :bgcolour, [:char, 10],
        :fgcolor, :pointer,
        :bgcolor, :pointer,
        :outfile, [:char, 256],
        :scale, :float,
        :option_1, :int,
        :option_2, :int,
        :option_3, :int,
        :show_hrt, :int,
        :fontsize, :int,
        :input_mode, :int,
        :eci, :int,
        :text, [:uchar, 128],
        :rows, :int,
        :width, :int,
        :primary, [:char, 128],
        :encoded_data, [:uchar, 200 * 143],
        :row_height, [:float, 200],
        :errtxt, [:char, 100],
        :bitmap, :pointer,
        :bitmap_width, :int,
        :bitmap_height, :int,
        :alphamap, :pointer,
        :bitmap_byte_length, :uchar,
        :dot_size, :float,
        :vector, Vector.by_ref,
        :debug, :int,
        :warn_level, :int

      # @private
      def self.release(ptr)
        Native.ZBarcode_Delete(ptr)
      end
    end
  end
end
