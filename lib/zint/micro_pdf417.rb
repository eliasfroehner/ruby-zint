module Zint
  # MicroPDF417
  class MicroPdf417 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_MICROPDF417, **kwargs)
    end
  end
end
