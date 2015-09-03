#!/usr/bin/env ruby

userinput = ARGV[0]

# Finds all files with userinput and splits them into an
# array of strings.
filenames = `find -iname *#{userinput}*`.split
puts filenames

files = filenames.map { |dir| dir =~ /\.(|(rb)|(txt)|(erb)|(js)|(css)|(html)|(yml))$/ }
puts files
