module Zint
  RSpec.describe MaxiCode do
    describe "export" do
      it "export code" do
        maxicode_code = described_class.new(value: "012345678912")
        svg_file = maxicode_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/maxicode.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/maxicode.svg"))
      end
    end
  end
end
