module Zint
  RSpec.describe UpcE do
    describe "export" do
      it "export code" do
        upce_code = described_class.new(value: "12345670")
        svg_file = upce_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/upce.svg")).to eq svg_file
      end
    end
  end
end
