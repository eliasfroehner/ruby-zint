module Zint
  # MaxiCode
  class MaxiCode < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_MAXICODE, **kwargs)
    end
  end
end
