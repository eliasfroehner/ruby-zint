module Zint
  class Bind < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_BIND, options: options)
    end
  end
end
