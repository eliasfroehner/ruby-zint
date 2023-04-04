module Zint
  class UpcAChk < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_UPCA_CHK, options: options)
    end
  end
end
