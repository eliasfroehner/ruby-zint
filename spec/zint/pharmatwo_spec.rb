module Zint
  RSpec.describe PharmaTwo do
    describe "export" do
      it "export code" do
        pharmatwo_code = described_class.new(value: "01234567")
        svg_file = pharmatwo_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/pharmatwo.svg")
      end
    end
  end
end
