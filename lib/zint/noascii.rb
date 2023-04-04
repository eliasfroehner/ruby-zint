module Zint
  class NoAscii < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_NO_ASCII, options: options)
    end
  end
end
