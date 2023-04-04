module Zint
  class Ultra < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_ULTRA, options: options)
    end
  end
end
