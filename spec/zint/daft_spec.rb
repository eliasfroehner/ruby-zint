module Zint
  RSpec.describe Daft do
    describe "export" do
      it "export code" do
        daft_code = described_class.new(value: "DAFT")
        svg_file = daft_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/daft.svg")
      end
    end
  end
end
