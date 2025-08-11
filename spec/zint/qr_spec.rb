module Zint
  RSpec.describe Qr do
    let(:outfile) { File.join(Dir.tmpdir, "qr.svg") }
    let(:input_file) { "spec/fixtures/input_file.txt" }
    let(:qr_code) { described_class.new(value: "Test", ecc_level: Zint::Qr::ECC_LEVEL_L) }

    describe "ECC level" do
      it "exports ECC level L" do
        qr_code_ecc_l = described_class.new(value: "Test", ecc_level: Zint::Qr::ECC_LEVEL_L)
        svg_file = qr_code_ecc_l.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/qr/qr_ecc_l.svg")
      end

      it "exports ECC level M" do
        qr_code_ecc_m = described_class.new(value: "Test", ecc_level: Zint::Qr::ECC_LEVEL_M)
        svg_file = qr_code_ecc_m.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/qr/qr_ecc_m.svg")
      end

      it "exports ECC level H" do
        qr_code_ecc_h = described_class.new(value: "Test", ecc_level: Zint::Qr::ECC_LEVEL_H)
        svg_file = qr_code_ecc_h.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/qr/qr_ecc_h.svg")
      end

      it "exports ECC level Q" do
        qr_code_ecc_q = described_class.new(value: "Test", ecc_level: Zint::Qr::ECC_LEVEL_Q)
        svg_file = qr_code_ecc_q.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/qr/qr_ecc_q.svg")
      end

      it "has correct ecc level" do
        qr_code_ecc_q = described_class.new(value: "Test", ecc_level: Zint::Qr::ECC_LEVEL_Q)
        expect(qr_code_ecc_q.ecc_level).to eq Zint::Qr::ECC_LEVEL_Q
      end

      it "is different from other ECC levels" do
        qr_codes = [Zint::Qr::ECC_LEVEL_Q, Zint::Qr::ECC_LEVEL_H, Zint::Qr::ECC_LEVEL_M, Zint::Qr::ECC_LEVEL_L].map do |ecc_level|
          described_class.new(value: "Test", ecc_level: ecc_level).to_buffer
        end

        qr_codes.each_with_index do |base_qr_code, idx|
          qr_codes.each_with_index do |qr_code, qr_idx|
            next if qr_idx == idx

            expect(base_qr_code).not_to eq qr_code
          end
        end
      end
    end

    describe "ECI support" do
      it "should encode to cyrillic code" do
        # This code should be read as: "Больше слушай, меньше говори."
        barcode = Zint::Qr.new(segments: [source: "±ÞÛìèÕ áÛãèÐÙ, ÜÕÝìèÕ ÓÞÒÞàØ.".encode("ISO-8859-1"), eci: 7])

        svg_file = barcode.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/qr-code-with-eci.svg")
      end

      it "should encode from cyrillic code" do
        # This code should be read as: "Больше слушай, меньше говори."
        barcode = Zint::Qr.new(segments: [source: "Больше слушай, меньше говори.".encode("ISO-8859-5"), eci: 7])

        svg_file = barcode.to_memory_file(extension: ".svg")

        # Same file as above:
        expect(File.read("spec/fixtures/qr-code-with-eci.svg")).to eq svg_file
      end

      it "should encode multiple segments" do
        # This code should be read as: "ΚείμενοТекст文章"
        barcode = Zint::Barcode.new(segments: [{source: "Κείμενο".encode("ISO-8859-7"), eci: 9}, {source: "Текст".encode("ISO-8859-5"), eci: 7}, {source: "文章".encode("SHIFT_JIS"), eci: 20}], symbology: Zint::BARCODE_QRCODE)
        svg_file = barcode.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/qr-code-with-multi-segments.svg")
      end
    end
  end
end
