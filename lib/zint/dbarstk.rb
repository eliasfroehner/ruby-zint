module Zint
  # GS1 DataBar Stacked
  class DbarStk < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_DBAR_STK, options: options)
    end
  end
end
