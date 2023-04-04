module Zint
  RSpec.describe Eanx do
    describe "export" do
      it "export code" do
        eanx_code = described_class.new(value: "012345678912")
        svg_file = eanx_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/eanx.svg")).to eq svg_file
      end
    end
  end
end
