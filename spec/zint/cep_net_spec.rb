module Zint
  RSpec.describe CepNet do
    describe "export" do
      it "export code" do
        bind_code = described_class.new(value: "012345678912")
        svg_file = bind_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/cep_net.svg")
      end
    end
  end
end
