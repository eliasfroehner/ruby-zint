module Zint
  RSpec.describe Pdf417trunc do
    describe "export" do
      it "export code" do
        pdf417trunc_code = described_class.new(value: "012345678912")
        svg_file = pdf417trunc_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/pdf417trunc.svg")
      end
    end
  end
end
