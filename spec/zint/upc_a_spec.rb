module Zint
  RSpec.describe UpcA do
    describe "export" do
      it "export code" do
        upca_code = described_class.new(value: "012345678912")
        svg_file = upca_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/upca.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/upca.svg"))
      end
    end
  end
end
