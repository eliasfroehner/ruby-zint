module Zint
  RSpec.describe Code93 do
    describe "export" do
      it "export code" do
        code93_code = described_class.new(value: "012345678912")
        svg_file = code93_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/code93.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/code93.svg"))
      end
    end
  end
end
