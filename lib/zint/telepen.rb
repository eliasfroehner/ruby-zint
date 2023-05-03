module Zint
  # Telepen Alpha
  class Telepen < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_TELEPEN, options: options)
    end
  end
end
