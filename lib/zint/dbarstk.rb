module Zint
  # GS1 DataBar Stacked
  class DbarStk < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_DBAR_STK, **kwargs)
    end
  end
end
