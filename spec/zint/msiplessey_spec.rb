module Zint
  RSpec.describe MsiPlessey do
    describe "export" do
      it "export code" do
        msiplessey_code = described_class.new(value: "012345678912")
        svg_file = msiplessey_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/msiplessey.svg")
      end
    end
  end
end
