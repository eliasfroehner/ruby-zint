# ruby-zint

[![CI](https://github.com/api-walker/ruby-zint/actions/workflows/main.yml/badge.svg)](https://github.com/api-walker/ruby-zint/actions/workflows/main.yml)

This gem is a Ruby FFI binding for the [libzint](http://www.zint.org.uk) barcode generation library.

See the [documentation](https://rubydoc.info/github/api-walker/ruby-zint) for a full API description.

## Installation

Install the libzint binary with your package manager (eg. `apt install zint` or perhaps `brew install zint`).

Other platforms require building [from source](https://www.zint.org.uk/manual/chapter/2).

**NOTE:** It is assumed that you are using libzint with the version [2.10](https://sourceforge.net/projects/zint/files/zint/2.10.0/).

Then install this gem with:

```
$ gem install ruby-zint
```

Or include `gem "ruby-zint"` in your Gemfile.

## Usage

```ruby
require "zint"

barcode = Zint::Barcode.new(value: "Test", type: Zint::BARCODE_CODE128)

# Export to file
barcode.to_file(path: "out.png")

# Export file to memory
barcode.to_memory_file(extension: ".png")

# Write from Bitmap to own canvas
require "chunky_png"
png = ChunkyPNG::Image.new(bitmap.width, bitmap.height, ChunkyPNG::Color::TRANSPARENT)
white = ChunkyPNG::Color("white")
black = ChunkyPNG::Color("black")

bitmap = barcode.to_buffer
bitmap.pixels.each do |pixel|
  png.compose_pixel(pixel.x, pixel.y, (pixel.colour == "K") ? black : white)
end

png.save(buffer_outfile)

# Use vector export
vector_struct = barcode.to_vector
# See manual: https://zint.org.uk/manual/chapter/5#buffering-symbols-in-memory-vector

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
The project is based on the work and ideas of Angel Pizarro's [zint](https://github.com/delagoya/zint).
