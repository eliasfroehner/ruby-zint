module Zint
  RSpec.describe C25standard do
    describe "export" do
      it "export code" do
        c25standard_code = described_class.new(value: "012345678912")
        svg_file = c25standard_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/c25standard.svg")).to eq svg_file
      end
    end
  end
end
