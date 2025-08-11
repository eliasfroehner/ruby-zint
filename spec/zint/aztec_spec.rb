module Zint
  RSpec.describe Aztec do
    describe "export" do
      it "export code" do
        aztec_code = described_class.new(value: "012345678912")
        svg_file = aztec_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/aztec.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/aztec.svg"))
      end
    end
  end
end
