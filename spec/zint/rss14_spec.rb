module Zint
  RSpec.describe Rss14 do
    describe "export" do
      it "export code" do
        rss14_code = described_class.new(value: "012345678912")
        svg_file = rss14_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/rss14.svg")
      end
    end
  end
end
