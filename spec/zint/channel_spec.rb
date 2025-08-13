module Zint
  RSpec.describe Channel do
    describe "export" do
      it "export code" do
        channel_code = described_class.new(value: "0123456")
        svg_file = channel_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/channel.svg")
      end
    end
  end
end
