module Zint
  RSpec.describe Aztec do
    describe "export" do
      it "export code" do
        aztec_code = described_class.new(value: "012345678912")
        svg_file = aztec_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/aztec.svg")
      end
    end
  end
end
