#!/usr/bin/env ruby
def encode (character, key)
  char_code = character.downcase.ord #downcase and get ascii value of character
  return char_code unless (char_code >= 97 && char_code <= 122) #return all non alphabetic characters as is
  
  key = key < 0 ? -(-key % 26) : key % 26 #handle both negative and positive keys
  new_val = char_code + key
  
  new_val += 26 if (new_val < 97) #if new value is outside of alphabet its should wrap back around
  new_val -= 26 if (new_val > 122) #if new value is outside of alphabet its should wrap back around
  new_val -= 32 unless character.eql?(character.downcase) #if character was originally uppercase convert it back
  return new_val
end

def cipher (message,key)
  message.chars.map{|ch| encode(ch,key)}.pack('c*')
end

if (ARGV[0] && ARGV[1]) 
  unless ARGV[1].to_i
    puts "Second argument must be a number"
    return
  end
  puts cipher(ARGV[0], ARGV[1].to_i)
 else
  puts "Two arguments required"""
end