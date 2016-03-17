

#require 'pry'


# Returns `true` if elements in `arr` are all letters,
# numbers, or spaces, and `false` otherwise.
def validate_chars(arr)
  arr.each {|char| return false if
    !(("a".."z").cover?(char) ||
      ("0".."9").cover?(char) ||
       [" ","_"].include?(char))}
  true
end
# ---------------------------------------------------
# Returns an upcased `char` if it isn't an underscore
# and `counter` is even, and an unchanged `char` otherwise.
def char_modifier(char, counter)
  return char.upcase if (char != "_") && (counter % 2 == 0)
  char
end

# Returns `counter[0] + 1` if `char` isn't an underscore,
# and `1` otherwise.
def new_counter(counter, char)
  return counter.next if char != "_"
  1
end

# Generates a new array with elements mapped from `source`
# and alternatively capitalized.
def populate_studly(source, counter)
  source.map do |char|
    counter = new_counter(counter, char)
    char_modifier(char, counter)
  end
end
# ------------------------------------------------

# Creates a MySpace username based on `name`.
def name_generator(name)
  lowercase = name.downcase.chars
  return "Error: please only use letters, numbers, spaces or underscores." unless validate_chars(lowercase)
  lowercase.each_index {|index| lowercase[index] = "_" if lowercase[index] == " "}
  studly = populate_studly(lowercase, 1).join.prepend("xX_").concat("_Xx")
end

#binding.pry
