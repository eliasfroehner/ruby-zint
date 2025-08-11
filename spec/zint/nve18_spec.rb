module Zint
  RSpec.describe Nve18 do
    describe "export" do
      it "export code" do
        nve18_code = described_class.new(value: "12345678901234567")
        svg_file = nve18_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/nve18.svg")
      end
    end
  end
end
