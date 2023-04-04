module Zint
  RSpec.describe UpcEChk do
    describe "export" do
      it "export code" do
        upcechk_code = described_class.new(value: "12345670")
        svg_file = upcechk_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/upcechk.svg")).to eq svg_file
      end
    end
  end
end
