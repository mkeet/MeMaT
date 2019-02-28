#!/usr/bin/env ruby
#A good line begins with a number and is followed by a line that begins with a number (or end of file)
#A number has to be followed by ., :, ;, space, or tab
pre_match = false
pre = nil

for l in STDIN do
  l.strip!
  match = (l.match(/^[0-9]+(\.|:|;| |\t)/) != nil)
  puts(pre) if pre_match and match
  pre = l
  pre_match = match
end

puts(pre) if pre_match
