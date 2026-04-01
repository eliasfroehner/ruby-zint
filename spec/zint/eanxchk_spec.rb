module Zint
  RSpec.describe :EanxChk do
    before :all do
      prev_deprecated = Warning[:deprecated]
      Warning[:deprecated] = true
      expect { EanxChk }.to output(%r{deprecated.*spec/zint/eanxchk_spec}).to_stderr
    ensure
      Warning[:deprecated] = prev_deprecated
    end

    describe "export" do
      it "export code" do
        eanxchk_code = Zint::EanxChk.new(value: "012345678912")
        svg_file = eanxchk_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/eanxchk.svg")
      end
    end
  end
end
