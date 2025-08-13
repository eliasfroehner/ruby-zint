module Zint
  RSpec.describe Code128AB do
    describe "export" do
      it "export code" do
        code128b_code = described_class.new(value: "012345678912")
        svg_file = code128b_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/code128b.svg")
      end
    end
  end
end
