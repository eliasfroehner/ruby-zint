module Zint
  RSpec.describe Plessey do
    describe "export" do
      it "export code" do
        plessey_code = described_class.new(value: "012345678912")
        svg_file = plessey_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/plessey.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/plessey.svg"))
      end
    end
  end
end
