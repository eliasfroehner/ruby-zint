module Zint
  RSpec.describe NoAscii do
    describe "export" do
      it "export code" do
        noascii_code = described_class.new(value: "012345678912")
        svg_file = noascii_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/noascii.svg")).to eq svg_file
      end
    end
  end
end
