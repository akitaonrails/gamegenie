# TODO: Write documentation for `Gamegenie`
require "./binary"
require "./nintendo"

module Gamegenie
  VERSION = "0.1.0"

  class Main
    def decode(code)
      puts "CODE: #{code}"
      nintendo = Gamegenie::Nintendo.new
      bytes = nintendo.code_to_bytes(code)
      puts "Scrambled:   #{nintendo.format_bytes(bytes)}"
      result = nintendo.decode_bytes(bytes)
      puts "Unscrambled: #{nintendo.format_bytes(result)}"
      hex_result = nintendo.to_hex(result)
      puts "DECODED: #{hex_result}"
    end
  end
end

unless ARGV.empty?
  Gamegenie::Main.new.decode(ARGV[0])
end
