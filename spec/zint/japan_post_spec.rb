module Zint
  RSpec.describe JapanPost do
    describe "export" do
      it "export code" do
        japanpost_code = described_class.new(value: "012345678912")
        svg_file = japanpost_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/japanpost.svg")).to eq svg_file
      end
    end
  end
end
