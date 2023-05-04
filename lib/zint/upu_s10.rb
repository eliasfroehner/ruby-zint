module Zint
  # Universal Postal Union S10
  class UpuS10 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_UPU_S10, **kwargs)
    end
  end
end
