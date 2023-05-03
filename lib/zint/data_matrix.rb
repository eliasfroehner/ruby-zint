module Zint
  # Data Matrix (ECC200)
  class DataMatrix < Barcode
    # Options
    DM_NULL = 0
    DM_ASCII = 1
    DM_C40 = 2
    DM_TEXT = 3
    DM_X12 = 4
    DM_EDIFACT = 5
    DM_BASE256 = 6

    def initialize(value: nil, input_file: nil, type: Zint::BARCODE_DATAMATRIX, options: {})
      raise ArgumentError, "Invalid type for DataMatrix code" unless [Zint::BARCODE_DATAMATRIX, Zint::BARCODE_HIBC_DM].include?(type)

      super(value: value, input_file: input_file, type: type, options: {option_3: Zint::DM_SQUARE}.merge(options))
    end
  end
end
