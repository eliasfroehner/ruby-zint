module Zint
  # Han Xin (Chinese Sensible) Code
  class Hanxin < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_HANXIN, **kwargs)
    end
  end
end
