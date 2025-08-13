module Zint
  # DX Film Edge Barcode on 35mm and APS films
  class Dxfilmedge < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_DXFILMEDGE, **kwargs)
    end
  end
end
