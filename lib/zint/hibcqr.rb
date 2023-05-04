module Zint
  # HIBC QR Code
  class HibcQr < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_HIBC_QR, **kwargs)
    end
  end
end
