module Zint
  RSpec.describe DotCode do
    describe "export" do
      it "export code" do
        dotcode_code = described_class.new(value: "1234567890")
        svg_file = dotcode_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/dotcode.svg")).to eq svg_file
      end
    end
  end
end
