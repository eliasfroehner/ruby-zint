module Zint
  # UK Plessey
  class Plessey < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_PLESSEY, options: options)
    end
  end
end
