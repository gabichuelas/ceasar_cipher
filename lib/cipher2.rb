# this solution uses zip, then to_h to create alphabet key
class CipherTwo

  ALPHA = ("a".."z").to_a

  def encode(message, shift)
    characters = message.downcase.chars
    result = []
    characters.each do |char|
      if ALPHA.include?(char) == false
        result << char
      else
        result << make_cipher(shift)[char]
      end
    end
    result.join.upcase
  end

  def make_cipher(shift)
    cipher = ALPHA.rotate(-shift)
    ALPHA.zip(cipher).to_h
  end

  def solve_cipher(shift)
    solved = ALPHA.rotate(shift)
    ALPHA.zip(solved).to_h
  end

  def decode(message, shift)
    characters = message.downcase.chars
    result = []
    characters.each do |char|
      if ALPHA.include?(char) == false
        result << char
      else
        result << solve_cipher(shift)[char]
      end
    end
    original = result.join.split(" ")
    original.map { |word| word.capitalize }.join(" ")
  end



end

# cipher = Cipher.new
# p cipher.encode("hello!", 3)
