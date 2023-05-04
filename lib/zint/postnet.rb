module Zint
  # USPS (U.S. Postal Service) POSTNET
  class Postnet < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_POSTNET, **kwargs)
    end
  end
end
