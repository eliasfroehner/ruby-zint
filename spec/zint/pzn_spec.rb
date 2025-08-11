module Zint
  RSpec.describe Pzn do
    describe "export" do
      it "export code" do
        pzn_code = described_class.new(value: "0123456")
        svg_file = pzn_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/pzn.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/pzn.svg"))
      end
    end
  end
end
