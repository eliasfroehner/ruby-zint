module Zint
  RSpec.describe Channel do
    describe "export" do
      it "export code" do
        channel_code = described_class.new(value: "0123456")
        svg_file = channel_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/channel.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/channel.svg"))
      end
    end
  end
end
