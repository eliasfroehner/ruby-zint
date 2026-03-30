module Zint
  LIBZ_VERSION = ENV["LIBZ_VERSION"] || "1.3.2"
  LIBZ_SOURCE_URI = "http://zlib.net/fossils/zlib-#{LIBZ_VERSION}.tar.gz"
  LIBZ_SOURCE_SHA256 = "bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2dfa8de64f0119d16"

  ZINT_VERSION = ENV["ZINT_VERSION"] || "2.16.0"
  ZINT_SOURCE_URI = "https://downloads.sourceforge.net/zint/zint-#{ZINT_VERSION}-src.tar.gz"
  ZINT_SOURCE_SHA256 = "37e767afada2403bb9ae49b93a19eb0a9e944a0c278d9f23522746b3d08a3c4b"

  LIBPNG_VERSION = ENV["LIBPNG_VERSION"] || "1.6.56"
  LIBPNG_SOURCE_URI = "https://download.sourceforge.net/libpng/libpng-#{LIBPNG_VERSION}.tar.xz"
  LIBPNG_SOURCE_SHA256 = "f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18"

  MINI_PORTILE_VERSION = "~> 2.1"
end
