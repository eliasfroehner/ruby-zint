module Zint
  RSpec.describe AusReply do
    describe "export" do
      it "export code" do
        ausreply_code = described_class.new(value: "96184209")
        svg_file = ausreply_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/ausreply.svg")
      end
    end
  end
end
