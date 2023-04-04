module Zint
  RSpec.describe Planet do
    describe "export" do
      it "export code" do
        planet_code = described_class.new(value: "012345678912")
        svg_file = planet_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/planet.svg")).to eq svg_file
      end
    end
  end
end
