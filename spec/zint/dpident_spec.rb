module Zint
  RSpec.describe Dpident do
    describe "export" do
      it "export code" do
        dpident_code = described_class.new(value: "01234567891")
        svg_file = dpident_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/dpident.svg")).to eq svg_file
      end
    end
  end
end
