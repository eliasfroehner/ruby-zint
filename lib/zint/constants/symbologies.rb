module Zint
  module Constants
    # Symbologies (`symbol->symbology`)
    module Symbologies
      # Tbarcode 7 codes
      BARCODE_CODE11 = 1 #  Code 11
      BARCODE_C25STANDARD = 2 #  2 of 5 Standard (Matrix)
      BARCODE_C25MATRIX = 2 #  Legacy
      BARCODE_C25INTER = 3 #  2 of 5 Interleaved
      BARCODE_C25IATA = 4 #  2 of 5 IATA
      BARCODE_C25LOGIC = 6 #  2 of 5 Data Logic
      BARCODE_C25IND = 7 #  2 of 5 Industrial
      BARCODE_CODE39 = 8 #  Code 39
      BARCODE_EXCODE39 = 9 #  Extended Code 39
      BARCODE_EANX = 13 #  EAN (European Article Number)
      BARCODE_EANX_CHK = 14 #  EAN + Check Digit
      BARCODE_GS1_128 = 16 #  GS1-128
      BARCODE_EAN128 = 16 #  Legacy
      BARCODE_CODABAR = 18 #  Codabar
      BARCODE_CODE128 = 20 #  Code 128
      BARCODE_DPLEIT = 21 #  Deutsche Post Leitcode
      BARCODE_DPIDENT = 22 #  Deutsche Post Identcode
      BARCODE_CODE16K = 23 #  Code 16k
      BARCODE_CODE49 = 24 #  Code 49
      BARCODE_CODE93 = 25 #  Code 93
      BARCODE_FLAT = 28 #  Flattermarken
      BARCODE_DBAR_OMN = 29 #  GS1 DataBar Omnidirectional
      BARCODE_RSS14 = 29 #  Legacy
      BARCODE_DBAR_LTD = 30 #  GS1 DataBar Limited
      BARCODE_RSS_LTD = 30 #  Legacy
      BARCODE_DBAR_EXP = 31 #  GS1 DataBar Expanded
      BARCODE_RSS_EXP = 31 #  Legacy
      BARCODE_TELEPEN = 32 #  Telepen Alpha
      BARCODE_UPCA = 34 #  UPC-A
      BARCODE_UPCA_CHK = 35 #  UPC-A + Check Digit
      BARCODE_UPCE = 37 #  UPC-E
      BARCODE_UPCE_CHK = 38 #  UPC-E + Check Digit
      BARCODE_POSTNET = 40 #  USPS POSTNET
      BARCODE_MSI_PLESSEY = 47 #  MSI Plessey
      BARCODE_FIM = 49 #  Facing Identification Mark
      BARCODE_LOGMARS = 50 #  LOGMARS
      BARCODE_PHARMA = 51 #  Pharmacode One-Track
      BARCODE_PZN = 52 #  Pharmazentralnummer
      BARCODE_PHARMA_TWO = 53 #  Pharmacode Two-Track
      BARCODE_PDF417 = 55 #  PDF417
      BARCODE_PDF417COMP = 56 #  Compact PDF417 (Truncated PDF417)
      BARCODE_PDF417TRUNC = 56 #  Legacy
      BARCODE_MAXICODE = 57 #  MaxiCode
      BARCODE_QRCODE = 58 #  QR Code
      BARCODE_CODE128B = 60 #  Code 128 (Subset B)
      BARCODE_AUSPOST = 63 #  Australia Post Standard Customer
      BARCODE_AUSREPLY = 66 #  Australia Post Reply Paid
      BARCODE_AUSROUTE = 67 #  Australia Post Routing
      BARCODE_AUSREDIRECT = 68 #  Australia Post Redirection
      BARCODE_ISBNX = 69 #  ISBN
      BARCODE_RM4SCC = 70 #  Royal Mail 4 State
      BARCODE_DATAMATRIX = 71 #  Data Matrix (ECC200)
      BARCODE_EAN14 = 72 #  EAN-14
      BARCODE_VIN = 73 #  Vehicle Identification Number
      BARCODE_CODABLOCKF = 74 #  Codablock-F
      BARCODE_NVE18 = 75 #  NVE-18 (SSCC-18)
      BARCODE_JAPANPOST = 76 #  Japanese Postal Code
      BARCODE_KOREAPOST = 77 #  Korea Post
      BARCODE_DBAR_STK = 79 #  GS1 DataBar Stacked
      BARCODE_RSS14STACK = 79 #  Legacy
      BARCODE_DBAR_OMNSTK = 80 #  GS1 DataBar Stacked Omnidirectional
      BARCODE_RSS14STACK_OMNI = 80 #  Legacy
      BARCODE_DBAR_EXPSTK = 81 #  GS1 DataBar Expanded Stacked
      BARCODE_RSS_EXPSTACK = 81 #  Legacy
      BARCODE_PLANET = 82 #  USPS PLANET
      BARCODE_MICROPDF417 = 84 #  MicroPDF417
      BARCODE_USPS_IMAIL = 85 #  USPS Intelligent Mail (OneCode)
      BARCODE_ONECODE = 85 #  Legacy
      BARCODE_PLESSEY = 86 #  Plessey Code

      #  Tbarcode 8 codes
      BARCODE_TELEPEN_NUM = 87 #  Telepen Numeric
      BARCODE_ITF14 = 89 #  ITF-14
      BARCODE_KIX = 90 #  Dutch Post KIX Code
      BARCODE_AZTEC = 92 #  Aztec Code
      BARCODE_DAFT = 93 #  DAFT Code
      BARCODE_DPD = 96 #  DPD Code
      BARCODE_MICROQR = 97 #  Micro QR Code

      #  Tbarcode 9 codes
      BARCODE_HIBC_128 = 98 #  HIBC Code 128
      BARCODE_HIBC_39 = 99 #  HIBC Code 39
      BARCODE_HIBC_DM = 102 #  HIBC Data Matrix
      BARCODE_HIBC_QR = 104 #  HIBC QR Code
      BARCODE_HIBC_PDF = 106 #  HIBC PDF417
      BARCODE_HIBC_MICPDF = 108 #  HIBC MicroPDF417
      BARCODE_HIBC_BLOCKF = 110 #  HIBC Codablock-F
      BARCODE_HIBC_AZTEC = 112 #  HIBC Aztec Code

      #  Tbarcode 10 codes
      BARCODE_DOTCODE = 115 #  DotCode
      BARCODE_HANXIN = 116 #  Han Xin (Chinese Sensible) Code

      #  Tbarcode 11 codes
      BARCODE_MAILMARK = 121 #  Royal Mail 4-state Mailmark

      #  Zint specific
      BARCODE_AZRUNE = 128 #  Aztec Runes
      BARCODE_CODE32 = 129 #  Code 32
      BARCODE_EANX_CC = 130 #  EAN Composite
      BARCODE_GS1_128_CC = 131 #  GS1-128 Composite
      BARCODE_EAN128_CC = 131 #  Legacy
      BARCODE_DBAR_OMN_CC = 132 #  GS1 DataBar Omnidirectional Composite
      BARCODE_RSS14_CC = 132 #  Legacy
      BARCODE_DBAR_LTD_CC = 133 #  GS1 DataBar Limited Composite
      BARCODE_RSS_LTD_CC = 133 #  Legacy
      BARCODE_DBAR_EXP_CC = 134 #  GS1 DataBar Expanded Composite
      BARCODE_RSS_EXP_CC = 134 #  Legacy
      BARCODE_UPCA_CC = 135 #  UPC-A Composite
      BARCODE_UPCE_CC = 136 #  UPC-E Composite
      BARCODE_DBAR_STK_CC = 137 #  GS1 DataBar Stacked Composite
      BARCODE_RSS14STACK_CC = 137 #  Legacy
      BARCODE_DBAR_OMNSTK_CC = 138 #  GS1 DataBar Stacked Omnidirectional Composite
      BARCODE_RSS14_OMNI_CC = 138 #  Legacy
      BARCODE_DBAR_EXPSTK_CC = 139 #  GS1 DataBar Expanded Stacked Composite
      BARCODE_RSS_EXPSTACK_CC = 139 #  Legacy
      BARCODE_CHANNEL = 140 #  Channel Code
      BARCODE_CODEONE = 141 #  Code One
      BARCODE_GRIDMATRIX = 142 #  Grid Matrix
      BARCODE_UPNQR = 143 #  UPNQR (Univerzalnega Plačilnega Naloga QR)
      BARCODE_ULTRA = 144 #  Ultracode
      BARCODE_RMQR = 145 #  Rectangular Micro QR Code (rMQR)
    end
  end
end
