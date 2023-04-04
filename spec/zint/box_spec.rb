module Zint
  RSpec.describe Box do
    describe "export" do
      it "export code" do
        box_code = described_class.new(value: "012345678912")
        svg_file = box_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/box.svg")).to eq svg_file
      end
    end
  end
end
