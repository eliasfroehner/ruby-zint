module Zint
  class AusRedirect < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_AUSREDIRECT, options: options)
    end
  end
end
