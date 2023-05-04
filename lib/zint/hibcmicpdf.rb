module Zint
  # HIBC MicroPDF417
  class HibcMicpdf < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_HIBC_MICPDF, **kwargs)
    end
  end
end
