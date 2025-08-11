module Zint
  module Constants
    # Specific options (`symbol->option_3`)
    module SpecificOptions
      DM_SQUARE = 100 # Only consider square versions on automatic symbol size selection
      DM_DMRE = 101 # Consider DMRE versions on automatic symbol size selection
      DM_ISO_144 = 128 # Use ISO instead of "de facto" format for 144x144 (i.e. don't skew ECC)

      ZINT_FULL_MULTIBYTE = 200 # Enable Kanji/Hanzi compression for Latin-1 & binary data
      ULTRA_COMPRESSION = 128 # Enable Ultracode compression (experimental)
    end
  end
end
