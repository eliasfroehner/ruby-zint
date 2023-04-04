module Zint
  RSpec.describe Aztec do
    describe "export" do
      it "export code" do
        aztec_code = described_class.new(value: "012345678912")
        svg_file = aztec_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/aztec.svg")).to eq svg_file
      end
    end
  end
end
