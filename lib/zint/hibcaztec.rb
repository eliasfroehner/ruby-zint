module Zint
  # HIBC Aztec Code
  class HibcAztec < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_HIBC_AZTEC, options: options)
    end
  end
end
