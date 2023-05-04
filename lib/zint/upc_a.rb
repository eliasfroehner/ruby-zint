module Zint
  # UPC-A
  class UpcA < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_UPCA, **kwargs)
    end
  end
end
