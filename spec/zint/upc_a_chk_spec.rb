module Zint
  RSpec.describe UpcAChk do
    describe "export" do
      it "export code" do
        upcachk_code = described_class.new(value: "012345678912")
        svg_file = upcachk_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/upcachk.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/upcachk.svg"))
      end
    end
  end
end
