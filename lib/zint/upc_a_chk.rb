module Zint
  # UPC-A + Check Digit
  class UpcAChk < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_UPCA_CHK, **kwargs)
    end
  end
end
