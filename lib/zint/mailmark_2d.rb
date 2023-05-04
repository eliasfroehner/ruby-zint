module Zint
  # Royal Mail 2D Mailmark (CMDM) (Data Matrix)
  class Mailmark2D < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_MAILMARK_2D, **kwargs)
    end
  end
end
