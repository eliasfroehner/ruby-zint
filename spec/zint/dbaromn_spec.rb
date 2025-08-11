module Zint
  RSpec.describe DbarOmn do
    describe "export" do
      it "export code" do
        dbaromn_code = described_class.new(value: "0950110153001")
        svg_file = dbaromn_code.to_memory_file(extension: ".svg")

        dbaromn_code = described_class.new(value: "0950110153001")
        dbaromn_code.to_file(path: "spec/fixtures/dbaromn.svg")
        File.write("spec/fixtures/dbaromn.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/dbaromn.svg"))
      end
    end
  end
end
