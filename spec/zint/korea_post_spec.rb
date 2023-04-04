module Zint
  RSpec.describe KoreaPost do
    describe "export" do
      it "export code" do
        koreapost_code = described_class.new(value: "012345")
        svg_file = koreapost_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/koreapost.svg")).to eq svg_file
      end
    end
  end
end
