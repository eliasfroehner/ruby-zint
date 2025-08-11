module Zint
  RSpec.describe OneCode do
    describe "export" do
      it "export code" do
        onecode_code = described_class.new(value: "01234567890123456789")
        svg_file = onecode_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/onecode.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/onecode.svg"))
      end
    end
  end
end
