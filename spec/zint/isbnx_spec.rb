module Zint
  RSpec.describe Isbnx do
    describe "export" do
      it "export code" do
        isbnx_code = described_class.new(value: "9783161484100")
        svg_file = isbnx_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/isbnx.svg")).to eq svg_file
      end
    end
  end
end
