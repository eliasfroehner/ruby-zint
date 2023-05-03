module Zint
  # Royal Mail 4-State Mailmark
  class Mailmark4S < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_MAILMARK_4S, options: options)
    end
  end
end
