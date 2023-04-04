module Zint
  RSpec.describe Daft do
    describe "export" do
      it "export code" do
        daft_code = described_class.new(value: "DAFT")
        svg_file = daft_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/daft.svg")).to eq svg_file
      end
    end
  end
end
