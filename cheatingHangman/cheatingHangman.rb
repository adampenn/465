#!/usr/bin/env ruby

dictionary = File.read("words").split

puts "Enter word length between 5-20: "
wordLength = gets.chomp().to_i

if wordLength > 20
  wordLength = 20
  puts "You inputed a number greater then 20 so I made it 20."
elsif wordLength < 5
  wordLength = 5
  puts "You inputed a number less then 5 so I made it 5."
end

dictionary.keep_if { |x| x.length == wordLength }

numOfTries = 0
while numOfTries < 10
  puts "Enter your guess: "
  guess = gets.chomp().to_c
  dictionary.keep_if { |x| x.include? "#{guess}" == false }
  numOfTries = numOfTries + 1
end
