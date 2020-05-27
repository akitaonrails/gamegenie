module Gamegenie
  module Binary
    CONVERT = {
      "0000" => "0",
      "0001" => "1",
      "0010" => "2",
      "0011" => "3",
      "0100" => "4",
      "0101" => "5",
      "0110" => "6",
      "0111" => "7",
      "1000" => "8",
      "1001" => "9",
      "1010" => "A",
      "1011" => "B",
      "1100" => "C",
      "1101" => "D",
      "1110" => "E",
      "1111" => "F"
    }

    def to_hex(string_of_bytes)
      string_of_bytes = clean_bytes(string_of_bytes)
      String.build do |io|
        (0..28).step(4) do |x|
          io << CONVERT[string_of_bytes[x, 4]] rescue IndexError
        end
      end
    end

    def format_bytes(bytes)
      bytes = clean_bytes(bytes)
      String.build do |io|
        (0..28).step(4) do |x|
          begin
            io << bytes[x, 4]
            io << " " unless x == 28
          rescue IndexError
          end
        end
      end
    end

    def clean_bytes(bytes)
      bytes.gsub(" ", "")
    end
  end
end
