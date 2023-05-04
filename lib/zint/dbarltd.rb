module Zint
  #  GS1 DataBar Limited
  class DbarLtd < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_DBAR_LTD, **kwargs)
    end
  end
end
