module Zint
  RSpec.describe C25logic do
    describe "export" do
      it "export code" do
        c25logic_code = described_class.new(value: "012345678912")
        svg_file = c25logic_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/c25logic.svg")).to eq svg_file
      end
    end
  end
end
