hash = Hash.new
vowels = ["a","e","i","o","u","y"]
ALPHABET = ("a".."z").to_a

ALPHABET.each do |letter|
  if vowels.include?(letter)
    hash[letter.to_sym] = ALPHABET.index(letter) + 1
  end
end

puts hash
