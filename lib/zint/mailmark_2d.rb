module Zint
  # Royal Mail 2D Mailmark (CMDM) (Data Matrix)
  class Mailmark2D < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_MAILMARK_2D, options: options)
    end
  end
end
