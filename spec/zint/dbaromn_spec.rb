module Zint
  RSpec.describe DbarOmn do
    describe "export" do
      it "export code" do
        dbaromn_code = described_class.new(value: "0950110153001")
        svg_file = dbaromn_code.to_memory_file(extension: ".svg")

        dbaromn_code = described_class.new(value: "0950110153001")
        dbaromn_code.to_file(path: "spec/fixtures/dbaromn.svg")
        expect(File.read("spec/fixtures/dbaromn.svg")).to eq svg_file
      end
    end
  end
end
