module Zint
  RSpec.describe Dpident do
    describe "export" do
      it "export code" do
        dpident_code = described_class.new(value: "01234567891")
        svg_file = dpident_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/dpident.svg")
      end
    end
  end
end
