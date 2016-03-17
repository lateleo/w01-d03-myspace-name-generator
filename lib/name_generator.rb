# You'll have to create your own method(s) here and define them. Use patterns like
# you've seen elsewhere.

#require 'pry'

# Changes the array so that any elements that were spaces are now underscores.
def replace_spaces(arr)
  arr.each_index do |index|
    if arr[index] == " "
      arr[index] = "_"
    end
  end
end

# Adds a range of characters to an array between `char` and `limit`.
def add_chars(arr, char, limit)
  while !arr.include?(limit)
    arr.push(char)
    char = char.next
  end
end

# Uses add_chars to populate an array with a-z and 0-9 as strings.
def populate_valid_chars(arr)
  add_chars(arr, "a", "z")
  add_chars(arr, "0", "9")
end

# Determines if the `subject` has any elements not in `reference`.
def valid_array?(subject, reference)
  valid = true
  subject.each do |char|
    valid = false if !reference.include?(char)
  end
  valid
end

# Fills valid_chars and then checks `arr` for any invalid characters.
def validate_chars(arr)
  valid_chars = [" "]
  populate_valid_chars(valid_chars)
  valid_array?(arr, valid_chars)
end

# Determines whether or not the character's case should be changed
def should_upcase?(char, count)
  (char != "_") && (count % 2 == 0)
end

# Modifies the `char` if necessary, and then pushes it.
def char_push(count, char, arr)
  arr.push(char.upcase) if should_upcase?(char, count)
  arr.push(char) if !should_upcase?(char, count)
end

# Determines what the new value for `count` should be.
def new_count (count, char)
  return count.next if char != "_"
  0
end

# Uses char_push and new_count to populate the `target` with
# elements from the `source` in varying letter case.
def populate_studly(source,target)
  count = 0
  source.each do |char|
    char_push(count, char, target)
    count = new_count(count, char)
  end
end

# Creates a string with alternating letter case and appropriate bookends.
def finish_studly(source, target)
  populate_studly(source, target)
  target.join.prepend("xX_").concat("_Xx")
end

# Creates a MySpace username based on `name`.
def name_generator(name)
  lowercase = name.downcase.chars
  return "Error: please only use letters, numbers or spaces." unless validate_chars(lowercase)
  replace_spaces(lowercase)
  studly = []
  finish_studly(lowercase, studly)
end

#binding.pry
