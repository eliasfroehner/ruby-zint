module Zint
  RSpec.describe Code93 do
    describe "export" do
      it "export code" do
        code93_code = described_class.new(value: "012345678912")
        svg_file = code93_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/code93.svg")).to eq svg_file
      end
    end
  end
end
