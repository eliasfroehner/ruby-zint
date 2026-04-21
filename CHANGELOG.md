## v1.6.0 [2026-04-21] Lars Kanis <lars@greiz-reinsdorf.de>

Added:

- Add Windows-on-ARM binary gem. [#25](https://github.com/eliasfroehner/ruby-zint/pull/25)
- Add `Zint::Ean8` and `Zint::Ean13` and deprecate `Zint::Eanx`. [#27](https://github.com/eliasfroehner/ruby-zint/pull/27)
  This is to follow changes in zint-2.16.

Changed:

- Update to libzint-2.16. [#26](https://github.com/eliasfroehner/ruby-zint/pull/26)

Removed:

- Drop support of ruby < 3.0


## v1.5.0 [2025-08-14] Elias Fröhner <apiwalker96@gmail.com>

Added:

- Add binary gems for all major platforms. [#21](https://github.com/eliasfroehner/ruby-zint/pull/21)
  The binary gems don't depend on the libzint package on the running system or on CMake or libpng.
  They have libzint builtin, are usually preferred by rubygems and bundler and should ease installation.
- Add barcode segments support. [#22](https://github.com/eliasfroehner/ruby-zint/pull/22)
  To be used like
  `Zint::Barcode.new(segments: [source: "Больше".encode("ISO-8859-5"), eci: 7])`
- Add new symbology class `Zint::Dxfilmedge`

Changed:

- Update to libzint-2.15. [#22](https://github.com/eliasfroehner/ruby-zint/pull/22)
- Use native memory-file support of libzint-2.15 to implement `Zint::Barcode#to_memory_file`

Removed:

- `Zint::Barcode#fontsize` and `Zint::Barcode#fontsize=`
