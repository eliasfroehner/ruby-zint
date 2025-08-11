module Zint
  LIBZ_VERSION = ENV["LIBZ_VERSION"] || "1.3.1"
  LIBZ_SOURCE_URI = "http://zlib.net/fossils/zlib-#{LIBZ_VERSION}.tar.gz"
  LIBZ_SOURCE_SHA1 = "f535367b1a11e2f9ac3bec723fb007fbc0d189e5"

  ZINT_VERSION = ENV["ZINT_VERSION"] || "2.12.0"
  ZINT_SOURCE_URI = "https://downloads.sourceforge.net/zint/zint-#{ZINT_VERSION}-src.tar.gz"
  ZINT_SOURCE_SHA1 = "6e16036d9822895edededd96e65da755ef3fdb69"

  LIBPNG_VERSION = ENV["LIBPNG_VERSION"] || "1.6.50"
  LIBPNG_SOURCE_URI = "https://netcologne.dl.sourceforge.net/project/libpng/libpng16/#{LIBPNG_VERSION}/libpng-#{LIBPNG_VERSION}.tar.xz"
  LIBPNG_SOURCE_SHA1 = "ecd92ba84628a8ace430706c85fd2fb26ba0882c"

  MINI_PORTILE_VERSION = "~> 2.1"
end
