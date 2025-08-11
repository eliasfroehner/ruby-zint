module Zint
  RSpec.describe Kix do
    describe "export" do
      it "export code" do
        kix_code = described_class.new(value: "012345678912")
        svg_file = kix_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/kix.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/kix.svg"))
      end

      it "provides row_heights" do
        heights = Zint::Kix.new(value: "130203").encode.row_heights
        expect(heights).to eq [3.0, 2.0, 3.0]
      end
    end
  end
end
