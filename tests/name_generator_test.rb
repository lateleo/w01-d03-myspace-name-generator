require_relative '../lib/name_generator.rb'
require_relative "test_helper.rb"

# Define whatever methods you need first
class NameGeneratorTest < Minitest::Test

# add first test soon
  #def test_valid_chars
  #  result = validate_chars(["b","c","d","x","y","_","1","2","7","8"].join)
  #  assert(result, "Characters should be valid")
  #end

  #def test_invalid_chars
  #  result = validate_chars(["a","b","@"].join)
  #  refute(result, "'@' is an invalid character")
  #end

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
    assert_equal("Error: please only use alphanumerics, spaces or underscores.",
    result, "Should have recieved error message")
  end
end
