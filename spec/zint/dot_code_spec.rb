module Zint
  RSpec.describe DotCode do
    describe "export" do
      it "export code" do
        dotcode_code = described_class.new(value: "1234567890")
        svg_file = dotcode_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/dotcode.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/dotcode.svg"))
      end
    end
  end
end
