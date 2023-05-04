module Zint
  # UPC-E
  class UpcE < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_UPCE, **kwargs)
    end
  end
end
