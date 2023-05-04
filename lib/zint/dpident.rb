module Zint
  # Deutsche Post Identcode
  class Dpident < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_DPIDENT, **kwargs)
    end
  end
end
