module Zint
  RSpec.describe UpcAChk do
    describe "export" do
      it "export code" do
        upcachk_code = described_class.new(value: "012345678912")
        svg_file = upcachk_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/upcachk.svg")).to eq svg_file
      end
    end
  end
end
