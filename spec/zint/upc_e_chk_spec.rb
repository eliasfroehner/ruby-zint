module Zint
  RSpec.describe UpcEChk do
    describe "export" do
      it "export code" do
        upcechk_code = described_class.new(value: "12345670")
        svg_file = upcechk_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/upcechk.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/upcechk.svg"))
      end
    end
  end
end
