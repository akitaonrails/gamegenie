module Gamegenie
  class Nintendo
    LETTERS = {
      'A' => "0000",
      'P' => "0001",
      'Z' => "0010",
      'L' => "0011",
      'G' => "0100",
      'I' => "0101",
      'T' => "0110",
      'Y' => "0111",
      'E' => "1000",
      'O' => "1001",
      'X' => "1010",
      'U' => "1011",
      'K' => "1100",
      'S' => "1101",
      'V' => "1110",
      'N' => "1111",
    }

    def code_to_bytes(code)
      String.build do |io|
        code.chars.each do |char|
          io << LETTERS[char] || ""
        end
      end
    end

    # 0    4    8    12   16   20   24   28
    # Aaaa Bbbb Cccc Dddd Eeee Ffff Gggg Hhhh
    # 1ddd Efff Bccc Deee Ghhh Fggg Abbb Haaa

    # 0    4    8    12   16   20
    # Aaaa Bbbb Cccc Dddd Eeee Ffff
    # 1ddd Efff Bccc Deee Abbb Faaa

    def decode_bytes(bytes)
      bytes = Binary.clean_bytes(bytes)
      String.build do |io|
        io << "1"
        io << bytes[13, 3] # ddd
        io << bytes[16] # E
        io << bytes[21, 3] # fff
        io << bytes[4]  # B
        io << bytes[9, 3]  # ccc
        io << bytes[12] # D
        io << bytes[17, 3] # eee
        if bytes.size > 24
          io << bytes[24] # G
          io << bytes[29, 3] # hhh
          io << bytes[20] # F
          io << bytes[25, 3] # ggg
          io << bytes[0]  # A
          io << bytes[5, 3]  # bbb
          io << bytes[28] # H
          io << bytes[1, 3]  # aaa
        else
          io << bytes[0]  # A
          io << bytes[5, 3]  # bbb
          io << bytes[20] # F
          io << bytes[1, 3]  # aaa
        end
      end
    end
  end
end
