module Zint
  RSpec.describe Postnet do
    describe "export" do
      it "export code" do
        postnet_code = described_class.new(value: "012345678912")
        svg_file = postnet_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/postnet.svg")).to eq svg_file
      end
    end
  end
end
