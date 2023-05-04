module Zint
  # Channel Code
  class Channel < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_CHANNEL, **kwargs)
    end
  end
end
