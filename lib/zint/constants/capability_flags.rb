module Zint
  module Constants
    # Capability flags (ZBarcode_Cap() `cap_flag`)
    module CapabilityFlags
      ZINT_CAP_HRT = 0x0001 # Prints Human Readable Text? */
      ZINT_CAP_STACKABLE = 0x0002 # Is stackable? */
      ZINT_CAP_EXTENDABLE = 0x0004 # Is extendable with add-on data? (Is EAN/UPC?) */
      ZINT_CAP_COMPOSITE = 0x0008 # Can have composite data? */
      ZINT_CAP_ECI = 0x0010 # Supports Extended Channel Interpretations? */
      ZINT_CAP_GS1 = 0x0020 # Supports GS1 data? */
      ZINT_CAP_DOTTY = 0x0040 # Can be output as dots? */
      ZINT_CAP_QUIET_ZONES = 0x0080 # Has default quiet zones? */
      ZINT_CAP_FIXED_RATIO = 0x0100 # Has fixed width-to-height (aspect) ratio? */
      ZINT_CAP_READER_INIT = 0x0200 # Supports Reader Initialisation? */
      ZINT_CAP_FULL_MULTIBYTE = 0x0400 # Supports full-multibyte option? */
      ZINT_CAP_MASK = 0x0800 # Is mask selectable? */
      ZINT_CAP_STRUCTAPP = 0x1000 # Supports Structured Append? */
      ZINT_CAP_COMPLIANT_HEIGHT = 0x2000 # Has compliant height? */
    end
  end
end
