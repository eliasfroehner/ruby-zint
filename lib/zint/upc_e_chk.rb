module Zint
  # UPC-E + Check Digit
  class UpcEChk < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_UPCE_CHK, **kwargs)
    end
  end
end
