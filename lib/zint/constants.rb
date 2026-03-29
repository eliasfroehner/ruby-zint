module Zint
  module Constants
    # The largest amount of data that can be encoded is 4350 4-byte UTF-8 chars in Han Xin Code
    ZINT_MAX_DATA_LEN = 17400
    # Maximum number of segments allowed for (`seg_count`)
    ZINT_MAX_SEG_COUNT = 256
  end
end
