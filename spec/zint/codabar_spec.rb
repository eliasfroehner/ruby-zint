module Zint
  RSpec.describe Codabar do
    describe "export" do
      it "export code" do
        codabar_code = described_class.new(value: "A37859B")
        svg_file = codabar_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/codabar.svg")).to eq svg_file
      end
    end
  end
end
