module Zint
  # Micro QR Code
  class MicroQr < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_MICROQR, **kwargs)
    end
  end
end
