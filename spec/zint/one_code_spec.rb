module Zint
  RSpec.describe OneCode do
    describe "export" do
      it "export code" do
        onecode_code = described_class.new(value: "01234567890123456789")
        svg_file = onecode_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/onecode.svg")).to eq svg_file
      end
    end
  end
end
