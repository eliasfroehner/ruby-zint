module Zint
  RSpec.describe Azrune do
    describe "export" do
      it "export code" do
        azrune_code = described_class.new(value: "123")
        svg_file = azrune_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/azrune.svg")).to eq svg_file
      end
    end
  end
end
