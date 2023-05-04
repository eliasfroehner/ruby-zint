module Zint
  # DPD Code
  class Dpd < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_DPD, **kwargs)
    end
  end
end
