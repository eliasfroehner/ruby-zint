module Zint
  RSpec.describe RssLtd do
    describe "export" do
      it "export code" do
        rssltd_code = described_class.new(value: "012345678912")
        svg_file = rssltd_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/rssltd.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/rssltd.svg"))
      end
    end
  end
end
