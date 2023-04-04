module Zint
  RSpec.describe DottyMode do
    describe "export" do
      it "export code" do
        dottymode_code = described_class.new(value: "012345678912")
        svg_file = dottymode_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/dottymode.svg")).to eq svg_file
      end
    end
  end
end
