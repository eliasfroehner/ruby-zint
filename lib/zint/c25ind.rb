module Zint
  #  2 of 5 Industrial
  class C25ind < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_C25IND, **kwargs)
    end
  end
end
