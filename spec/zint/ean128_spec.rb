module Zint
  RSpec.describe Ean128 do
    describe "export" do
      it "export code" do
        ean128_code = described_class.new(value: "[01]12345678901231")
        svg_file = ean128_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/ean128.svg")
      end
    end
  end
end
