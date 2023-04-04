module Zint
  RSpec.describe Ean14 do
    describe "export" do
      it "export code" do
        ean14_code = described_class.new(value: "1234567890123")
        svg_file = ean14_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/ean14.svg")).to eq svg_file
      end
    end
  end
end
