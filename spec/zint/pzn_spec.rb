module Zint
  RSpec.describe Pzn do
    describe "export" do
      it "export code" do
        pzn_code = described_class.new(value: "0123456")
        svg_file = pzn_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/pzn.svg")
      end
    end
  end
end
