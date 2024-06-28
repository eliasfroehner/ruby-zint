module Zint
  RSpec.describe Kix do
    describe "export" do
      it "export code" do
        kix_code = described_class.new(value: "012345678912")
        svg_file = kix_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/kix.svg")).to eq svg_file
      end

      it "provides row_heights" do
        heights = Zint::Kix.new(value: "130203").encode.row_heights
        expect(heights).to eq [3.0, 2.0, 3.0]
      end
    end
  end
end
