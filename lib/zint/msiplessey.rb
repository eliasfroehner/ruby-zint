module Zint
  # MSI Plessey
  class MsiPlessey < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_MSI_PLESSEY, **kwargs)
    end
  end
end
