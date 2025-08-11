module Zint
  RSpec.describe Code32 do
    describe "export" do
      it "export code" do
        code32_code = described_class.new(value: "01234567")
        svg_file = code32_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/code32.svg")
      end
    end
  end
end
