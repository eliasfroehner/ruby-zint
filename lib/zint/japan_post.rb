module Zint
  # Japanese Postal Code
  class JapanPost < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_JAPANPOST, **kwargs)
    end
  end
end
