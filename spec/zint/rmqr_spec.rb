module Zint
  RSpec.describe Rmqr do
    describe "export" do
      it "export code" do
        rmqr_code = described_class.new(value: "012345678912")
        svg_file = rmqr_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/rmqr.svg")).to eq svg_file
      end
    end
  end
end
