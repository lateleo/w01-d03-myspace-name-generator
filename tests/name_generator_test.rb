require_relative '../lib/name_generator.rb'
require_relative "test_helper.rb"

# Define whatever methods you need first
class NameGeneratorTest < Minitest::Test

# add first test soon
  def test_valid_chars
    result = validate_chars(["b","c","d","x","y","_","1","2","7","8"])
    assert(result, "Characters should be valid")
  end

  def test_invalid_chars
    result = validate_chars(["a","b","@"])
    refute(result, "'@' is an invalid character")
  end

# (Expand to see old tests)
#  def test_char_mod_upcase
#    result = char_modifier("a", 0)
#    assert_equal("A", result, "Should be capital A")
#  end
#
#  def test_char_mod_no_upcase
#    result = char_modifier("a", 1)
#    assert_equal("a", result, "Should be lowercase a")
#  end
#
#  def test_char_mod_number
#    upcase = char_modifier("5", 0)
#    no_upcase = char_modifier("5", 1)
#    assert_equal(upcase, no_upcase, "Should not change")
#  end
#
#  def test_new_counter_a
#    result = new_counter(0, "a")
#    assert_equal(1, result, "Should be 1")
#  end
#
#  def test_new_counter_5
#    result = new_counter(0, "5")
#    assert_equal(1, result, "Should be 1")
#  end
#
#  def test_new_counter_underscore
#    result = new_counter(5, "_")
#    assert_equal(1, result, "Should be 0")
#  end

  def test_Art_Burtch
    result = name_generator("Art Burtch")
    assert_equal("xX_ArT_BuRtCh_Xx", result, "Should be 'xX_ArT_BuRtCh_Xx'")
  end

  def test_Arthur_Burtch
    result = name_generator("Arthur Burtch")
    assert_equal("xX_ArThUr_BuRtCh_Xx", result, "Should be 'xX_ArThUr_BuRtCh_Xx'")
  end

  def test_Arthur_13urtch
    result = name_generator("Arthur 13urtch")
    assert_equal("xX_ArThUr_13UrTcH_Xx", result, "Should be 'xX_ArThUr_13UrTcH_Xx'")
  end

  def test_symbols
    result = name_generator("@r+#ur 13ur+c#!")
    assert_equal("Error: please only use letters, numbers, spaces or underscores.",
    result, "Should have recieved error message")
  end
end
