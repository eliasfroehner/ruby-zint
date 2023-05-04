module Zint
  # Legacy
  class Mailmark < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_MAILMARK, **kwargs)
    end
  end
end
