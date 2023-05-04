module Zint
  # Rectangular Micro QR Code (rMQR)
  class Rmqr < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_RMQR, **kwargs)
    end
  end
end
