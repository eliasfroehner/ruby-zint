module Zint
  RSpec.describe Rmqr do
    describe "export" do
      it "export code" do
        rmqr_code = described_class.new(value: "012345678912")
        svg_file = rmqr_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/rmqr.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/rmqr.svg"))
      end
    end
  end
end
