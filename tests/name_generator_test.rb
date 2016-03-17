require_relative '../lib/name_generator.rb'
require_relative "test_helper.rb"

# Define whatever methods you need first
def affirm_equals(actual, expected)
  if actual == expected
    puts "."
  else
    puts "Failure: '#{actual}' does not match '#{expected}'"
  end
end

# 1st Test
result = name_generator("Art Burtch")
affirm_equals(result, "xX_ArT_BuRtCh_Xx")

# 2nd Test
result = name_generator("Arthur Burtch")
affirm_equals(result, "xX_ArThUr_BuRtCh_Xx")

# 3rd Test
result = name_generator("aRTHUR bURTCH")
affirm_equals(result, "xX_ArThUr_BuRtCh_Xx")

# 4th Test
rresult = name_generator("ARthUR BURtch")
affirm_equals(result, "xX_ArThUr_BuRtCh_Xx")

# 5th Test
result = name_generator("Arthur 13urtch")
affirm_equals(result, "xX_ArThUr_13UrTcH_Xx")

# 6th Test
result = name_generator("@r+#ur 13ur+c#!")
affirm_equals(result, "Error: please only use letters, numbers or spaces.")
