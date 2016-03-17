require_relative '../lib/name_generator.rb'

# Define whatever methods you need first
def affirm_equals(actual, expected)
  if actual == expected
    puts "Success! '#{actual}' is correct!"
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
result = name_generator("@rthur Burtch")
affirm_equals(result, "Error: please use only letters, numbers or spaces.")
