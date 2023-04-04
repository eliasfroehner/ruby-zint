module Zint
  class Nve18 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_NVE18, options: options)
    end
  end
end
