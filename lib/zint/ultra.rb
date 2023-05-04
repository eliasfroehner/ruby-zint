module Zint
  # Ultracode
  class Ultra < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_ULTRA, **kwargs)
    end
  end
end
