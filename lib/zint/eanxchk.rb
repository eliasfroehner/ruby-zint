module Zint
  # EAN + Check Digit
  class EanxChk < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_EANX_CHK, **kwargs)
    end
  end
end
