module Zint
  RSpec.describe Pdf417comp do
    describe "export" do
      it "export code" do
        pdf417comp_code = described_class.new(value: "012345678912")
        svg_file = pdf417comp_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/pdf417comp.svg")
      end
    end
  end
end
