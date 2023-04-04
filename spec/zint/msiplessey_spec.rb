module Zint
  RSpec.describe MsiPlessey do
    describe "export" do
      it "export code" do
        msiplessey_code = described_class.new(value: "012345678912")
        svg_file = msiplessey_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/msiplessey.svg")).to eq svg_file
      end
    end
  end
end
