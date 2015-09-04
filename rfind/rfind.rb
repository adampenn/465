#!/usr/bin/env ruby

userinput = ARGV[0]
matchingfiles = `find -iname *#{userinput}*`.split
matchingfiles.keep_if { |dir| dir =~ /\.(|(rb)|(txt)|(erb)|(js)|(css)|(html)|(yml))$/ }
matchingfiles.collect! { |x| "  " + x }
puts "Files with names that matches <#{userinput}>", matchingfiles
puts "**************************************************"
allfiles = (`find .`.split).keep_if { |dir| dir =~ /\.(|(rb)|(txt)|(erb)|(js)|(css)|(html)|(yml))$/ }
puts "Files with content that matches <#{userinput}>"
allfiles.each do |filename|
  matchingcontents = `grep -n -i #{userinput} #{filename}`.split("\n")
  matchingcontents.collect! { |x| "  " + x }
  if matchingcontents.size() > 0
    puts filename
    puts matchingcontents
    puts "--------------------------------------------------"
  end
end
