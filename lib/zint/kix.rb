module Zint
  # Dutch Post KIX Code
  class Kix < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_KIX, options: options)
    end
  end
end
