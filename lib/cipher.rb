class Cipher

  ALPHA = ("a".."z").to_a

  def encode(message, shift)
    characters = message.downcase.chars
    result = []
    characters.each do |char|
      if ALPHA.include?(char) == false
        result << char
      else
        make_cipher(shift).each do |pair|
          result << pair[1] if pair[0] == char
        end
      end
    end
    result.join.upcase
  end

  def decode(message, shift)
    characters = message.downcase.chars
    result = []
    characters.each do |char|
      if ALPHA.include?(char) == false
        result << char
      else
        solve_cipher(shift).each do |pair|
          result << pair[1] if pair[0] == char
        end
      end
    end
    original = result.join.split(" ")
    original.map { |word| word.capitalize }.join(" ")
  end

  def make_cipher(shift)
    cipher = ALPHA.rotate(-shift)
    ALPHA.zip(cipher)
  end

  def solve_cipher(shift)
    solved = ALPHA.rotate(shift)
    ALPHA.zip(solved)
  end

end

# cipher = Cipher.new
# p cipher.encode("hello!", 3)
