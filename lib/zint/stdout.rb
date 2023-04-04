module Zint
  class Stdout < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_STDOUT, options: options)
    end
  end
end
