#!/usr/bin/env ruby

=begin
INSTRUCTIONS:
    Implement a method #substrings that takes a word as the first argument and
    then an array of valid substrings (your dictionary) as the second argument.
    It should return a hash listing each substring (case insensitive) that was 
    found in the original string and how many times it was found.

EXAMPLE:
    dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    substrings("Howdy partner, sit down! How's it going?", dictionary) => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

=end

def substrings sentence, dictionary
    unless (sentence.is_a?(String) && dictionary.is_a?(Array))
        puts "invalid arguments"
        return
    end
    hash = dictionary.to_h {|item|[item.downcase,0]}
    sentence.downcase!
    hash.each_key {|key| hash[key] = sentence.scan(key).length}
    puts hash.select {|key,value| value > 0}
end