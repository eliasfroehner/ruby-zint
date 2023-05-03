module Zint
  #  GS1 DataBar Limited
  class DbarLtd < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_DBAR_LTD, options: options)
    end
  end
end
