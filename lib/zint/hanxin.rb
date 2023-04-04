module Zint
  class Hanxin < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_HANXIN, options: options)
    end
  end
end
