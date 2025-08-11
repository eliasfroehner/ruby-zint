module Zint
  RSpec.describe Bc412 do
    describe "export" do
      it "export code" do
        bind_code = described_class.new(value: "012345678912")
        svg_file = bind_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/bc_412.svg")
      end
    end
  end
end
