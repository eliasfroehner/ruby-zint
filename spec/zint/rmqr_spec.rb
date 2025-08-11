module Zint
  RSpec.describe Rmqr do
    describe "export" do
      it "export code" do
        rmqr_code = described_class.new(value: "012345678912")
        svg_file = rmqr_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/rmqr.svg")
      end
    end
  end
end
