module Zint
  RSpec.describe MaxiCode do
    describe "export" do
      it "export code" do
        maxicode_code = described_class.new(value: "012345678912")
        svg_file = maxicode_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/maxicode.svg")).to eq svg_file
      end
    end
  end
end
