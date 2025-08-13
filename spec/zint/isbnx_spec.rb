module Zint
  RSpec.describe Isbnx do
    describe "export" do
      it "export code" do
        isbnx_code = described_class.new(value: "9783161484100")
        svg_file = isbnx_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/isbnx.svg")
      end
    end
  end
end
