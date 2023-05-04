module Zint
  # Australia Post Redirection
  class AusRedirect < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_AUSREDIRECT, **kwargs)
    end
  end
end
