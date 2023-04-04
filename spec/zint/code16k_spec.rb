module Zint
  RSpec.describe Code16k do
    describe "export" do
      it "export code" do
        code16k_code = described_class.new(value: "012345678912")
        svg_file = code16k_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/code16k.svg")).to eq svg_file
      end
    end
  end
end
