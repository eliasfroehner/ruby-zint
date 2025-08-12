module Zint
  RSpec.describe Dxfilmedge do
    describe "export" do
      it "export code" do
        vin_code = described_class.new(value: "012345")
        svg_file = vin_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/dxfilmedge.svg")
      end
    end
  end
end
