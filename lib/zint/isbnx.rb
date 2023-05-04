module Zint
  # ISBN
  class Isbnx < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_ISBNX, **kwargs)
    end
  end
end
