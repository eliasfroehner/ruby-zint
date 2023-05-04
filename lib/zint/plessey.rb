module Zint
  # UK Plessey
  class Plessey < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_PLESSEY, **kwargs)
    end
  end
end
