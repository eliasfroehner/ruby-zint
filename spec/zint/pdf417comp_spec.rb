module Zint
  RSpec.describe Pdf417comp do
    describe "export" do
      it "export code" do
        pdf417comp_code = described_class.new(value: "012345678912")
        svg_file = pdf417comp_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/pdf417comp.svg")).to eq svg_file
      end
    end
  end
end
