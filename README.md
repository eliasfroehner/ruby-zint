# ruby-zint

[![CI](https://github.com/api-walker/ruby-zint/actions/workflows/main.yml/badge.svg)](https://github.com/api-walker/ruby-zint/actions/workflows/main.yml)

This gem is a Ruby FFI binding for the [libzint](http://www.zint.org.uk) barcode generation library.

See the [documentation](https://rubydoc.info/github/api-walker/ruby-zint) for a full API description.

## Installation

By default ruby-zint first tries to use libzint installed on the system.
If libzint can't be found or if it isn't a supported version, then the zint version, bundled into the gem, is compiled and used.
Both install methods can be enforced by using `--enable-system-libzint` or `--disable-system-libzint` options, see below.

### With libzint source code (recommended)
First install CMake with your package manager (e. g. `apt install cmake`).

Afterwards install the gem and force builtin libzint:

```
$ gem install ruby-zint -- --disable-system-libzint
```

### With system libraries

Install the libzint binary with your package manager (e. g. `apt install zint` or perhaps `brew install zint`).

Other platforms require building [from source](https://www.zint.org.uk/manual/chapter/2).

**NOTE:** It is assumed that you are using libzint with the version [2.12](https://sourceforge.net/projects/zint/files/zint/2.12.0/).

Then install this gem and enforce system libzint:

```
$ gem install ruby-zint -- --enable-system-libzint
```

### Gemfile

Include `gem "ruby-zint"` in your Gemfile.
Optionally set the install option by running bundler like so:

```
bundle config build.ruby-zint --enable-system-libzint
```

### PNG support

Please install libpng (e. g. `apt install libpng-dev`) before installing the gem if you want to use the PNG format.

## Usage

```ruby
require "zint"

barcode = Zint::Barcode.new(value: "Test", symbology: Zint::BARCODE_CODE128)

# Export to file
barcode.to_file(path: "out.png")

# Export file to memory
barcode.to_memory_file(extension: ".png")

# Write from Bitmap to own canvas
require "chunky_png"
png = ChunkyPNG::Image.new(bitmap.width, bitmap.height, ChunkyPNG::Color::TRANSPARENT)
white = ChunkyPNG::Color("white")
black = ChunkyPNG::Color("black")

bitmap = barcode.to_bitmap
bitmap.pixels.each do |pixel|
  png.compose_pixel(pixel.x, pixel.y, (pixel.colour == "1") ? black : white)
end

png.save("out.png")

# Use vector export
vec = Zint::Qr.new(value: "Test").to_vector
png = ChunkyPNG::Image.new(vec.width.to_i, vec.height.to_i, ChunkyPNG::Color::WHITE)
vec.each_rectangle do |rec|
  png.rect(rec.x.to_i, rec.y.to_i,
      rec.x.to_i+rec.width.to_i-1, rec.y.to_i+rec.height.to_i-1,
      ChunkyPNG::Color::BLACK, ChunkyPNG::Color::BLACK)
end
png.save("out.png")

# See also manual: https://zint.org.uk/manual/chapter/5#buffering-symbols-in-memory-vector

# Use file as input
barcode = Zint::Barcode.new(input_file: "/tmp/test.txt")
barcode.to_file(path: "out.png")

# Use of comfort classes

# EAN
ean_barcode = Zint::Eanx.new(value: "012345678912")
ean_barcode.to_file(path: "ean.png")

# Code128
code_128_barcode = Zint::Code128.new(value: "012345678912")
code_128_barcode.to_file(path: "code_128.png")

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/api-walker/ruby-zint.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Credits
The project is based on the work and ideas of Angel Pizarro's [zint](https://github.com/delagoya/zint). I would also like to say a big thank you to [Lars Kanis](https://github.com/larskanis) for his great contributions.
