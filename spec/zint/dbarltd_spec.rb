module Zint
  RSpec.describe DbarLtd do
    describe "export" do
      it "export code" do
        dbarltd_code = described_class.new(value: "0950110153001")
        svg_file = dbarltd_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/dbarltd.svg")
      end
    end
  end
end
