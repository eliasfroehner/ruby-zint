module Zint
  RSpec.describe :Eanx do
    if RUBY_VERSION >= "2.7."
      before :all do
        prev_deprecated = Warning[:deprecated]
        Warning[:deprecated] = true
        expect { Eanx }.to output(%r{deprecated.*spec/zint/eanx_spec}).to_stderr
      ensure
        Warning[:deprecated] = prev_deprecated
      end
    end

    describe "export" do
      it "export code" do
        eanx_code = Zint::Eanx.new(value: "012345678912")
        svg_file = eanx_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/ean13.svg")
      end
    end

    it "provides encoded_data" do
      enc = Zint::Eanx.new(value: "2092001474353").encode.encoded_data_as_array_of_strings
      expect(enc).to eq ["10100011010001011001101101001110001101011001101010101110010001001011100100001010011101000010101"]
    end
  end
end
