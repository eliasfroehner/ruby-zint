module Zint
  RSpec.describe Qr do
    let(:outfile) { File.join(Dir.tmpdir, "qr.svg") }
    let(:input_file) { "spec/fixtures/input_file.txt" }
    let(:qr_code) { described_class.new(value: "Test", ecc_level: Zint::Qr::ECC_LEVEL_L) }

    describe "ECC level" do
      it "exports ECC level L" do
        qr_code_ecc_l = described_class.new(value: "Test", ecc_level: Zint::Qr::ECC_LEVEL_L)
        svg_file = qr_code_ecc_l.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/qr/qr_ecc_l.svg")).to eq svg_file
      end

      it "exports ECC level M" do
        qr_code_ecc_m = described_class.new(value: "Test", ecc_level: Zint::Qr::ECC_LEVEL_M)
        svg_file = qr_code_ecc_m.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/qr/qr_ecc_m.svg")).to eq svg_file
      end

      it "exports ECC level H" do
        qr_code_ecc_h = described_class.new(value: "Test", ecc_level: Zint::Qr::ECC_LEVEL_H)
        svg_file = qr_code_ecc_h.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/qr/qr_ecc_h.svg")).to eq svg_file
      end

      it "exports ECC level Q" do
        qr_code_ecc_q = described_class.new(value: "Test", ecc_level: Zint::Qr::ECC_LEVEL_Q)
        svg_file = qr_code_ecc_q.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/qr/qr_ecc_q.svg")).to eq svg_file
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
  end
end
