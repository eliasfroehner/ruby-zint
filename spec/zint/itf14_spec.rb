module Zint
  RSpec.describe Itf14 do
    describe "export" do
      it "export code" do
        itf14_code = described_class.new(value: "012345678912")
        svg_file = itf14_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/itf14.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/itf14.svg"))
      end
    end
  end
end
