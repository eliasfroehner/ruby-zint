module Zint
  RSpec.describe Eanx do
    describe "export" do
      it "export code" do
        eanx_code = described_class.new(value: "012345678912")
        svg_file = eanx_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/eanx.svg")
      end
    end

    it "provides encoded_data" do
      enc = Zint::Eanx.new(value: "2092001474353").encode.encoded_data_as_array_of_strings
      expect(enc).to eq ["10100011010001011001101101001110001101011001101010101110010001001011100100001010011101000010101"]
    end
  end
end
