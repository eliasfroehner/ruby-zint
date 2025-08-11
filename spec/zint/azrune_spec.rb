module Zint
  RSpec.describe Azrune do
    describe "export" do
      it "export code" do
        azrune_code = described_class.new(value: "123")
        svg_file = azrune_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/azrune.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/azrune.svg"))
      end
    end
  end
end
