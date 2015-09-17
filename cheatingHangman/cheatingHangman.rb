#!/usr/bin/env ruby

dictionary = File.read("words").split

printf("Enter word length between 5-20: ")
wordLength = gets.chomp().to_i

if wordLength > 20
  wordLength = 20
elsif wordLength < 5
  wordLength = 5
end

dictionary.keep_if { |x| x.length == wordLength }

allGuesses = []
numOfTries = 9
fair = false
word = Array.new(wordLength, "_").join(" ")
secretWord = nil

while numOfTries >= 0
  printf("Enter your guess: ")
  guess = gets.chomp()
  while allGuesses.include?("#{guess}") || guess.size != 1 || guess =~ /[[:digit:]]/
    puts "Invlaid input"
    guess = gets.chomp()
  end
  allGuesses.push(guess)
  puts "(You have #{numOfTries} tries remaining)"
  if !fair
    backupDictionary = Array.new(dictionary)
    dictionary.keep_if { |x| x.include?("#{allGuesses.last}") == false }
    if dictionary.size == 0
      fair = true
      secretWord = backupDictionary.first
      correctGuess = allGuesses.delete("#{allGuesses.last}")
      word[secretWord.index("#{correctGuess}") * 2] = correctGuess
      numOfTries = numOfTries + 1
    end
  end
  if fair
    if secretWord.include?("#{allGuesses.last}")
      correctGuess = allGuesses.delete("#{allGuesses.last}")
      word[secretWord.index("#{correctGuess}") * 2] = correctGuess
      numOfTries = numOfTries + 1
    end
  end
  puts allGuesses.join(" ")
  puts word
  if !word.include?("_")
    puts "You win!"
    numOfTries = -2
  end
  numOfTries = numOfTries - 1
end
if numOfTries == -1
  puts "You're out of tries, you lose."
end
