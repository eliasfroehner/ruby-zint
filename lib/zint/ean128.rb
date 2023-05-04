module Zint
  # Legacy
  class Ean128 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_EAN128, **kwargs)
    end
  end
end
