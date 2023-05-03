module Zint
  # Telepen Numeric
  class TelepenNum < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_TELEPEN_NUM, options: options)
    end
  end
end
