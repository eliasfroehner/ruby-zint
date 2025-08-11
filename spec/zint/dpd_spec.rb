module Zint
  RSpec.describe Dpd do
    describe "export" do
      it "export code" do
        dpd_code = described_class.new(value: "%000393206219912345678101040")
        svg_file = dpd_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/dpd.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/dpd.svg"))
      end
    end
  end
end
