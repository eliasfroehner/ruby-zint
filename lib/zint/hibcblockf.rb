module Zint
  # HIBC Codablock-F
  class HibcBlockf < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_HIBC_BLOCKF, **kwargs)
    end
  end
end
