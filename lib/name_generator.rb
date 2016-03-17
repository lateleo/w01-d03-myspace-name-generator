

#require 'pry'


# Fills valid_chars and then checks
# `arr` for any invalid characters.
def validate_chars(arr)
  valid_chars = [" "]
  ("a".."z").each {|i| valid_chars.push(i)}
  ("0".."9").each {|i| valid_chars.push(i)}
  arr.each {|char| return false if !valid_chars.include?(char)}
  true
end

# ---------------------------------------------------
# Modifies the `char` if necessary,
# and then pushes it.
def char_push(count, char, arr)
  arr.push(char.upcase) if (char != "_") && (count % 2 == 0)
  arr.push(char) if !((char != "_") && (count % 2 == 0))
end

# Determines what the new value
# for `count` should be.
def new_count (count, char)
  return count.next if char != "_"
  0
end

# Uses char_push and new_count to
# populate the `target` with elements
# from the `source` in varying letter case.
def populate_studly(source,target)
  count = 0
  source.each do |char|
    char_push(count, char, target)
    count = new_count(count, char)
  end
end

def populate_studly(source,target)
  count = 0
  source.map do |char|
    if (char != "_") && (count % 2 == 0)
      count = count.next
      char.upcase
    elsif char == "_" || count % 2 != 0
      count = count.next if char != "_"
      count = 0 if char == "_"
      char
    end
  end
end
# ------------------------------------------------

# Creates a MySpace username based on `name`.
def name_generator(name)
  lowercase = name.downcase.chars
  return "Error: please only use letters, numbers or spaces." unless validate_chars(lowercase)
  lowercase.each_index {|index| lowercase[index] = "_" if lowercase[index] == " "}
  count = 0
  studly = lowercase.map do |char|
    if (char != "_") && (count % 2 == 0)
      count = count.next
      char.upcase
    elsif char == "_" || count % 2 != 0
      count = count.next if char != "_"
      count = 0 if char == "_"
      char
    end
  end
  studly.join.prepend("xX_").concat("_Xx")
end

#binding.pry
