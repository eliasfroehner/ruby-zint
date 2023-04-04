module Zint
  RSpec.describe DbarLtd do
    describe "export" do
      it "export code" do
        dbarltd_code = described_class.new(value: "0950110153001")
        svg_file = dbarltd_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/dbarltd.svg")).to eq svg_file
      end
    end
  end
end
