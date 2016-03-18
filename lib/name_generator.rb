
require 'pry'

# Returns `true` if elements in `arr` are all letters,
# numbers, or spaces, and `false` otherwise.
def validate_chars(arr)
  result = true
  arr.each {|char| result = false if /[^0-9a-z_]/.match(char)}
  result
end
# (Expand to see old code)
# Returns an upcased `char` if it isn't an underscore
# and `counter` is even, and an unchanged `char` otherwise.
# def char_modifier(char, counter)
#  (char != "_") && (counter % 2 == 0) ? char.upcase : char
# end
#
# Returns `counter[0] + 1` if `char` isn't an underscore,
# and `1` otherwise.
#def new_counter(counter, char)
#  char != "_" ? counter.next : 1
#end

# Generates a new array with elements mapped from `source`
# and alternatively capitalized.
def populate_studly(source)
  counter = 1
  source.map do |char|
    counter = (char != "_" ? counter.next : 1)
    (char != "_") && (counter % 2 == 0) ? char.upcase : char
  end
end
# ------------------------------------------------
# Creates a MySpace username based on `name`.
def name_generator(name)
  lowercase = name.downcase.gsub(/ /,"_").chars
  return "Error: please only use letters, numbers, spaces or underscores." unless validate_chars(lowercase)
  populate_studly(lowercase).join.prepend("xX_").concat("_Xx")
end

#binding.pry
