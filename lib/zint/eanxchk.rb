module Zint
  class EanxChk < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_EANX_CHK, options: options)
    end
  end
end
