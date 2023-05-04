module Zint
  # Korea Post
  class KoreaPost < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_KOREAPOST, **kwargs)
    end
  end
end
