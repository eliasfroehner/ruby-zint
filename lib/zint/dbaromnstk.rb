module Zint
  # GS1 DataBar Stacked Omnidirectional
  class DbarOmnstk < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_DBAR_OMNSTK, **kwargs)
    end
  end
end
