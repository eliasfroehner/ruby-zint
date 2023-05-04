module Zint
  #  Extended Code 39
  class Excode39 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_EXCODE39, **kwargs)
    end
  end
end
