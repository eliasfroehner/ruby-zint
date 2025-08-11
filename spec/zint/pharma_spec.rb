module Zint
  RSpec.describe Pharma do
    describe "export" do
      it "export code" do
        pharma_code = described_class.new(value: "012345")
        svg_file = pharma_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/pharma.svg")
      end
    end
  end
end
