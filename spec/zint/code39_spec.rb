module Zint
  RSpec.describe Code39 do
    describe "export" do
      it "export code" do
        code39_code = described_class.new(value: "012345678912")
        svg_file = code39_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/code39.svg")).to eq svg_file
      end
    end
  end
end
