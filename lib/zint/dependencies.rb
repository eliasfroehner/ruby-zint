module Zint
  ZINT_VERSION = ENV["ZINT_VERSION"] || "2.10.0"
  # ZINT_SOURCE_URI = "file://#{File.join(File.expand_path("../../../", __FILE__))}/ports/archives/zint-#{ZINT_VERSION}-src.tar.gz"
  ZINT_SOURCE_URI = "https://downloads.sourceforge.net/zint/zint-#{ZINT_VERSION}-src.tar.gz"
  ZINT_SOURCE_SHA1 = "e4a8a5ccbc9e1901e4b592ccc80e17184f2ff5e8"

  MINI_PORTILE_VERSION = "~> 2.1"
end
