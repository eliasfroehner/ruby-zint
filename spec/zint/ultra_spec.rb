module Zint
  RSpec.describe Ultra do
    describe "export" do
      it "export code" do
        ultra_code = described_class.new(value: "012345678912")
        svg_file = ultra_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/ultra.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/ultra.svg"))
      end
    end
  end
end
