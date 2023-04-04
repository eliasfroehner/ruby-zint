module Zint
  RSpec.describe AusReply do
    describe "export" do
      it "export code" do
        ausreply_code = described_class.new(value: "96184209")
        svg_file = ausreply_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/ausreply.svg")).to eq svg_file
      end
    end
  end
end
