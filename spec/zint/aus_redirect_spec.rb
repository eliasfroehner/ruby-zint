module Zint
  RSpec.describe AusRedirect do
    describe "export" do
      it "export code" do
        ausredirect_code = described_class.new(value: "96184209")
        svg_file = ausredirect_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/ausredirect.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/ausredirect.svg"))
      end
    end
  end
end
