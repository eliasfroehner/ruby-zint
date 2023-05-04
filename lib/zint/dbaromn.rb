module Zint
  # GS1 DataBar Omnidirectional
  class DbarOmn < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_DBAR_OMN, **kwargs)
    end
  end
end
