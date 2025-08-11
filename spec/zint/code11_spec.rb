module Zint
  RSpec.describe Code11 do
    describe "export" do
      it "export code" do
        code11_code = described_class.new(value: "012345678912")
        svg_file = code11_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/code11.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/code11.svg"))
      end
    end
  end
end
