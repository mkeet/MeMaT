#!/usr/bin/env ruby
for l in STDIN do
  m = l.match(/^([0-9]+)(\.|:|;| |\t)(.*)$/)
  #Bizarrely there are some 7-digit numbers in the xh
  printf("%07i\t%s\n", m[1].to_i, m[3].strip)
end
