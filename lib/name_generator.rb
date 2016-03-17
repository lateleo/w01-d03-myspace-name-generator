# You'll have to create your own method(s) here and define them. Use patterns like
# you've seen elsewhere.

require 'pry'
def add_letters(arr)
  alpha = "a"
  while !arr.include?("z")
    arr.push(alpha)
    alpha = alpha.next
  end
end

def add_numbers(arr)
  num = 0
  while !arr.include?(9)
    arr.push(num)
    num += 1
  end
end

def populate_valid_chars(arr)
  add_letters(arr)
  add_numbers(arr)
end

def validate_chars(arr)
  valid_chars = [" "]
  populate_valid_chars(valid_chars)
  arr.each do |char|
    if !valid_chars.include?(char)
      return false
    end
  end
  true
end

def letter_push(count, char, arr)
  arr.push(char.upcase) if count % 2 == 0
  arr.push(char) if count % 2 != 0
end

def populate_studly(arr1,arr2)
  count = 0
  arr1.each do |char|
    if char != "_"
      letter_push(count, char, arr2)
      count += 1
    else
      arr2.push(char)
      count = 0
    end
  end
end

def replace_spaces(arr)
  arr.each_index do |index|
    if arr[index] == " "
      arr[index] = "_"
    end
  end
end

def name_generator(name)
  lowercase = name.downcase.chars
  return "Error: please only use letters, numbers or spaces." unless validate_chars(lowercase)
  replace_spaces(lowercase)
  studly = []
  populate_studly(lowercase, studly)
  studly.join.prepend("xX_").concat("_Xx")
end

binding.pry
