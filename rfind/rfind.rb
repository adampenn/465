#!/usr/bin/env ruby

"happy.h" =~ /\.(|(rb)|(txt)|(erb)|(js)|(css)|(html)|(yml))$/
a = `find .`

use split function from string

filenames = `find -iname "*chico*"`.split
puts filenames

#how do I make a new array based on what this finds
filenames.map { |dir| dir =~ /\.(|(rb)|(txt)|(erb)|(js)|(css)|(html)|(yml))$/ }

[1, 2, 3].map { |n| n * n }



Ruby is fun
