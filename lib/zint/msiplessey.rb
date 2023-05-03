module Zint
  # MSI Plessey
  class MsiPlessey < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_MSI_PLESSEY, options: options)
    end
  end
end
