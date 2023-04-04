module Zint
  class GridMatrix < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_GRIDMATRIX, options: options)
    end
  end
end
