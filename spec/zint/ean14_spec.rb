module Zint
  RSpec.describe Ean14 do
    describe "export" do
      it "export code" do
        ean14_code = described_class.new(value: "1234567890123")
        svg_file = ean14_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/ean14.svg")
      end
    end
  end
end
