module Zint
  RSpec.describe Code49 do
    describe "export" do
      it "export code" do
        code49_code = described_class.new(value: "012345678912")
        svg_file = code49_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/code49.svg")).to eq svg_file
      end
    end
  end
end
