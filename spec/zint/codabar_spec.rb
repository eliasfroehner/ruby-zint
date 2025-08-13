module Zint
  RSpec.describe Codabar do
    describe "export" do
      it "export code" do
        codabar_code = described_class.new(value: "A37859B")
        svg_file = codabar_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/codabar.svg")
      end
    end
  end
end
