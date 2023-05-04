module Zint
  # Grid Matrix
  class GridMatrix < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_GRIDMATRIX, **kwargs)
    end
  end
end
