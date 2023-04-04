module Zint
  class UpcEChk < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_UPCE_CHK, options: options)
    end
  end
end
