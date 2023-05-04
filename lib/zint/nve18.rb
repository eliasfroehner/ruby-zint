module Zint
  # NVE-18 (SSCC-18)
  class Nve18 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_NVE18, **kwargs)
    end
  end
end
