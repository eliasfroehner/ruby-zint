module Zint
  RSpec.describe AusPost do
    describe "export" do
      it "export code" do
        auspost_code = described_class.new(value: "96184209")
        svg_file = auspost_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/auspost.svg")).to eq svg_file
      end
    end
  end
end
