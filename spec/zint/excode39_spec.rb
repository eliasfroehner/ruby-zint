module Zint
  RSpec.describe Excode39 do
    describe "export" do
      it "export code" do
        excode39_code = described_class.new(value: "012345678912")
        svg_file = excode39_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/excode39.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/excode39.svg"))
      end
    end
  end
end
