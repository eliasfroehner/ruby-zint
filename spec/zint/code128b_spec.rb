module Zint
  RSpec.describe Code128B do
    describe "export" do
      it "export code" do
        code128b_code = described_class.new(value: "012345678912")
        svg_file = code128b_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/code128b.svg")).to eq svg_file
      end
    end
  end
end
