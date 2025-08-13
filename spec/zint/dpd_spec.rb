module Zint
  RSpec.describe Dpd do
    describe "export" do
      it "export code" do
        dpd_code = described_class.new(value: "%000393206219912345678101040")
        svg_file = dpd_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/dpd.svg")
      end
    end
  end
end
