module Zint
  RSpec.describe AusRoute do
    describe "export" do
      it "export code" do
        ausroute_code = described_class.new(value: "96184209")
        svg_file = ausroute_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/ausroute.svg")).to eq svg_file
      end
    end
  end
end
