module Zint
  RSpec.describe KoreaPost do
    describe "export" do
      it "export code" do
        koreapost_code = described_class.new(value: "012345")
        svg_file = koreapost_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/koreapost.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/koreapost.svg"))
      end
    end
  end
end
