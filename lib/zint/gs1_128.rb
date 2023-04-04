module Zint
  # standard:disable Naming/ClassAndModuleCamelCase
  class Gs1_128 < Barcode
    # standard:enable Naming/ClassAndModuleCamelCase
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_GS1_128, options: options)
    end
  end
end
