# TODO: Write documentation for `Gamegenie`
require "./binary"
require "./nintendo"

module Gamegenie
  VERSION = "0.1.0"

  class Main
    def verbose(code)
      puts "CODE: #{code}"
      nintendo = Gamegenie::Nintendo.new
      bytes = nintendo.code_to_bytes(code)
      puts "Scrambled:   #{Binary.format_bytes(bytes)}"
      result = nintendo.decode_bytes(bytes)
      puts "Unscrambled: #{Binary.format_bytes(result)}"
      hex_result = Binary.to_hex(result)
      puts "DECODED: #{hex_result}"
    end

    def decode(code)
      nintendo = Gamegenie::Nintendo.new
      bytes = nintendo.code_to_bytes(code)
      result = nintendo.decode_bytes(bytes)
      puts Binary.to_hex(result)
    end
  end
end

unless ARGV.empty?
  if ARGV.size > 1
    Gamegenie::Main.new.verbose(ARGV[0])
  else
    Gamegenie::Main.new.decode(ARGV[0])
  end
end
