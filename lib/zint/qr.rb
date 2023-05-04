module Zint
  # QR Code
  class Qr < Barcode
    # ECC Levels
    ECC_LEVEL_L = 1
    ECC_LEVEL_M = 2
    ECC_LEVEL_Q = 3
    ECC_LEVEL_H = 4

    # Current ECC level of QR code
    attr_reader :ecc_level

    def initialize(value: nil, input_file: nil, ecc_level: ECC_LEVEL_L, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_QRCODE, **kwargs.merge(option_1: ecc_level))
      @ecc_level = ecc_level
    end
  end
end
