module Zint
  RSpec.describe Flat do
    describe "export" do
      it "export code" do
        flat_code = described_class.new(value: "012345678912")
        svg_file = flat_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/flat.svg")
      end
    end
  end
end
