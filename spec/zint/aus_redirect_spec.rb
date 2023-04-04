module Zint
  RSpec.describe AusRedirect do
    describe "export" do
      it "export code" do
        ausredirect_code = described_class.new(value: "96184209")
        svg_file = ausredirect_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/ausredirect.svg")).to eq svg_file
      end
    end
  end
end
