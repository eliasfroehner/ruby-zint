module Zint
  # Telepen Numeric
  class TelepenNum < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_TELEPEN_NUM, **kwargs)
    end
  end
end
