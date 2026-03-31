module Zint
  # EAN (European Article Number)
  #
  # Deprecated class -> use Ean8 or Ean13 instead.
  class Eanx < Barcode
    called = caller.find do |fn|
      !fn.include?(RbConfig::TOPDIR) && !fn.start_with?(File.expand_path("..", __dir__))
    end
    warn("Zint::Eanx is deprecated. Please use Ean8 or Ean13 instead! Called from #{called}", category: :deprecated)

    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_EANX, **kwargs)
    end
  end
end
