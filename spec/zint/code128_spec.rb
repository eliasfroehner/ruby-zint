module Zint
  RSpec.describe Code128 do
    describe "export" do
      it "export code" do
        code128_code = described_class.new(value: "012345678912")
        svg_file = code128_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/code128.svg")).to eq svg_file
      end
    end
  end
end
