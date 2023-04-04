module Zint
  RSpec.describe C25ind do
    describe "export" do
      it "export code" do
        c25ind_code = described_class.new(value: "012345678912")
        svg_file = c25ind_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/c25ind.svg")).to eq svg_file
      end
    end
  end
end
