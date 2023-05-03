module Zint
  # MicroPDF417
  class MicroPdf417 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_MICROPDF417, options: options)
    end
  end
end
