module Zint
  # GS1 DataBar Expanded Stacked
  class DbarExpstk < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_DBAR_EXPSTK, **kwargs)
    end
  end
end
