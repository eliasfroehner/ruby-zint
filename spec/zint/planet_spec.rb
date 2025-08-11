module Zint
  RSpec.describe Planet do
    describe "export" do
      it "export code" do
        planet_code = described_class.new(value: "012345678912")
        svg_file = planet_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/planet.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/planet.svg"))
      end
    end
  end
end
