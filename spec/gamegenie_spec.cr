require "./spec_helper"

describe Gamegenie do
  context "GameNintendo - code with condition" do
    it "converts code to bytes" do
      nintendo = Gamegenie::Nintendo.new
      expected = nintendo.clean_bytes("0110 1001 0001 0011 0101 1111 1000 1101")
      nintendo.code_to_bytes("TOPLINES").should eq(expected)
    end

    it "unscramble the bytes" do
      nintendo = Gamegenie::Nintendo.new
      expected = nintendo.clean_bytes("1011 0111 1001 0101 1101 1000 0001 1110")
      nintendo.decode_bytes("0110 1001 0001 0011 0101 1111 1000 1101").should eq(expected)
    end

    it "converts binary representation to hexadecimal" do
      nintendo = Gamegenie::Nintendo.new
      nintendo.to_hex("1011 0111 1001 0101 1101 1000 0001 1110").should eq("B795D81E")
    end

    it "format bytes in chunks of 4" do
      nintendo = Gamegenie::Nintendo.new
      nintendo.format_bytes("10110111100101011101100000011110").should eq("1011 0111 1001 0101 1101 1000 0001 1110")
    end
  end

  context "GameNintendo - code without condition" do
    it "converts code to bytes" do
      nintendo = Gamegenie::Nintendo.new
      expected = nintendo.clean_bytes("0000 0000 0110 1001 0010 1000")
      nintendo.code_to_bytes("AATOZE").should eq(expected)
    end

    it "unscramble the bytes" do
      nintendo = Gamegenie::Nintendo.new
      expected = nintendo.clean_bytes("1001 0000 0110 1010 0000 1000")
      nintendo.decode_bytes("0000 0000 0110 1001 0010 1000").should eq(expected)
    end

    it "converts binary representation to hexadecimal" do
      nintendo = Gamegenie::Nintendo.new
      nintendo.to_hex("1001 0000 0110 1010 0000 1000").should eq("906A08")
    end

    it "format bytes in chunks of 4" do
      nintendo = Gamegenie::Nintendo.new
      nintendo.format_bytes("10110111100101011101100000011110").should eq("1011 0111 1001 0101 1101 1000 0001 1110")
    end

  end
end
