module Zint
  # HIBC Codablock-F
  class HibcBlockf < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_HIBC_BLOCKF, options: options)
    end
  end
end
