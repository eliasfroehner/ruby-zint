module Zint
  RSpec.describe AusRedirect do
    describe "export" do
      it "export code" do
        ausredirect_code = described_class.new(value: "96184209")
        svg_file = ausredirect_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/ausredirect.svg")
      end
    end
  end
end
