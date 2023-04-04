module Zint
  RSpec.describe Kix do
    describe "export" do
      it "export code" do
        kix_code = described_class.new(value: "012345678912")
        svg_file = kix_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/kix.svg")).to eq svg_file
      end
    end
  end
end
