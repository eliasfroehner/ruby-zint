module Zint
  # HIBC Aztec Code
  class HibcAztec < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_HIBC_AZTEC, **kwargs)
    end
  end
end
