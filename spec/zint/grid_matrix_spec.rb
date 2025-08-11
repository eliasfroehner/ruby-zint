module Zint
  RSpec.describe GridMatrix do
    describe "export" do
      it "export code" do
        gridmatrix_code = described_class.new(value: "012345678912")
        svg_file = gridmatrix_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/gridmatrix.svg")
      end
    end
  end
end
