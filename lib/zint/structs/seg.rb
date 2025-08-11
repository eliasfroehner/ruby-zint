module Zint
  module Structs
    class Seg < FFI::Struct
      # /* Segment for use with `raw_segs` and API `ZBarcode_Encode_Segs()` */
      # struct zint_seg {
      #     unsigned char *source; /* Data to encode, or (`raw_segs`) data encoded */
      #     int length;         /* Length of `source`. If 0 or negative, `source` must be NUL-terminated */
      #     int eci;            /* Extended Channel Interpretation */
      # };

      layout :source, :pointer, # Data to encode, or (`raw_segs`) data encoded
          :length, :int, # Length of `source`. If 0 or negative, `source` must be NUL-terminated
          :eci, :int # Extended Channel Interpretation

      # Data to encode, or (`raw_segs`) data encoded
      def source
        self[:source].read_bytes(self[:length])
      end

      # Extended Channel Interpretation
      def eci
        self[:eci]
      end
    end
  end
end
