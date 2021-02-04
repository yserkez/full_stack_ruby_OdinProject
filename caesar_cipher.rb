=begin

  Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:
  
  EXAMPLE:
  > caesar_cipher("What a string!", 5) 
  => "Bmfy f xywnsl!"

=end
  
def encode (character, key)
  char_code = character.downcase.ord #downcase and get ascii value of character
  return char_code unless (char_code >= 97 && char_code <= 122) #return all non alphabetic characters as is
  
  key = key < 0 ? -(-key % 26) : key % 26 #handle both negative and positive keys
  new_val = char_code + key
  
  new_val += 26 if (new_val < 97) #if new value is outside of alphabet its should wrap back around
  new_val -= 26 if (new_val > 122)
  new_val -= 32 unless character.eql?(character.downcase) #if character was originally uppercase convert it back
  return new_val
end

def caesar_cipher (message,key)
  unless message.is_a?(String) && key.is_a?(Numeric)
    puts "invalid arguments"
    return
  end
  message.chars.map{|ch| encode(ch,key)}.pack('c*') #rotate each character and then return to string
end