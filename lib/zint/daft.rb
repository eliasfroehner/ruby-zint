module Zint
  # DAFT Code
  class Daft < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_DAFT, **kwargs)
    end
  end
end
