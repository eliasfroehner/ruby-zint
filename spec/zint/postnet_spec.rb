module Zint
  RSpec.describe Postnet do
    describe "export" do
      it "export code" do
        postnet_code = described_class.new(value: "012345678912")
        svg_file = postnet_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/postnet.svg")
      end
    end
  end
end
