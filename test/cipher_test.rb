require "minitest/autorun"
require "minitest/pride"
require "./lib/cipher"
require "./lib/cipher2"

class CipherTest < Minitest::Test
  def setup
    @cipher = Cipher.new
    @cipher2 = CipherTwo.new
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_it_can_encode
    assert_equal "CZGGJ RJMGY", @cipher.encode("Hello World", 5)
    assert_equal "CZGGJ RJMGY", @cipher2.encode("Hello World", 5)

  end

  def test_it_can_decode
    encrypted = @cipher.encode("Hello World", 5)
    encrypted2 = @cipher2.encode("Hello World", 5)

    assert_equal "Hello World", @cipher.decode(encrypted, 5)
    assert_equal "Hello World", @cipher2.decode(encrypted2, 5)

  end
end
