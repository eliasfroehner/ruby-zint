module Zint
  # HIBC MicroPDF417
  class HibcMicpdf < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_HIBC_MICPDF, options: options)
    end
  end
end
