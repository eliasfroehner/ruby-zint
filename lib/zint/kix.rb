module Zint
  # Dutch Post KIX Code
  class Kix < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_KIX, **kwargs)
    end
  end
end
