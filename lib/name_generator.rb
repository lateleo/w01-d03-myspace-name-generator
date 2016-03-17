# You'll have to create your own method(s) here and define them. Use patterns like
# you've seen elsewhere.

require 'pry'
def add_letters(arr)
  alpha = "A"
  while !arr.include?("Z")
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
  #add_numbers(arr)
end

valid_chars = [" "]
populate_valid_chars(valid_chars)

def validate_chars(arr)
  populate_valid_chars(valid_chars)
  var1 = nil
  arr.each do |char1|
    valid_chars.each do |char2|
      if char1 == char2
        var1 = char2
      end
    end
  end
  var1
end

def letter_push(count, char, arr)
  arr.push(char.downcase!) if count % 2 == 0
  arr.push(char) if count % 2 != 0
end

def populate_studly(arr1,arr2)
  count = 1
  arr1.each do |char|
    if char != "_"
      letter_push(count, char, arr2)
      count += 1
    else
      arr2.push(char)
      count = 1
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
  all_caps = name.upcase.chars
  replace_spaces(all_caps)
  studly = []
  populate_studly(all_caps, studly)
  studly.join.prepend("xX_").concat("_Xx")
end

binding.pry
