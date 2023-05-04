module Zint
  # Compact PDF417 (Truncated PDF417)
  class Pdf417comp < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_PDF417COMP, **kwargs)
    end
  end
end
