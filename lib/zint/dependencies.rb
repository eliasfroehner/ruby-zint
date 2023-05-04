module Zint
  ZINT_VERSION = ENV["ZINT_VERSION"] || "2.12.0"
  ZINT_SOURCE_URI = "https://downloads.sourceforge.net/zint/zint-#{ZINT_VERSION}-src.tar.gz"
  ZINT_SOURCE_SHA1 = "6e16036d9822895edededd96e65da755ef3fdb69"

  MINI_PORTILE_VERSION = "~> 2.1"
end
