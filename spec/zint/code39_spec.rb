module Zint
  RSpec.describe Code39 do
    describe "export" do
      it "export code" do
        code39_code = described_class.new(value: "012345678912")
        svg_file = code39_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/code39.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/code39.svg"))
      end
    end
  end
end
