module Zint
  # ITF-14
  class Itf14 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_ITF14, **kwargs)
    end
  end
end
