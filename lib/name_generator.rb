
require 'pry'

# Generates a new array with elements mapped from `source`
# and alternatively capitalized.
def studly(source)
  counter = 1
  source.chars.map do |char|
    counter = (char != "_" ? counter.next : 1)
    (char != "_") && (counter % 2 == 0) ? char.upcase : char
  end
end
# ------------------------------------------------
# Creates a MySpace username based on `name`.
def name_generator(name)
  subs = name.downcase.gsub(/ /,"_")
  return "Please only use alphanumerics, spaces or underscores." if /[^0-9a-z_]/.match(subs) != nil
  studly(subs).join.prepend("xX_").concat("_Xx")
end

#binding.pry
