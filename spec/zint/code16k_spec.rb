module Zint
  RSpec.describe Code16k do
    describe "export" do
      it "export code" do
        code16k_code = described_class.new(value: "012345678912")
        svg_file = code16k_code.to_memory_file(extension: ".svg")
        File.write("spec/fixtures/code16k.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/code16k.svg"))
      end
    end
  end
end
