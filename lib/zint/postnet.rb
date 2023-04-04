module Zint
  class Postnet < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_POSTNET, options: options)
    end
  end
end
