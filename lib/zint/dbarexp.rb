module Zint
  # GS1 DataBar Expanded
  class DbarExp < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_DBAR_EXP, **kwargs)
    end
  end
end
