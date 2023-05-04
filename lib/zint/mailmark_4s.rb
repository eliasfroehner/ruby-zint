module Zint
  # Royal Mail 4-State Mailmark
  class Mailmark4S < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_MAILMARK_4S, **kwargs)
    end
  end
end
