#!/usr/bin/env ruby
# Check if an argument is provided

if ARGV.length == 1
  input = ARGV[0]

  #Regular expression to match the pattern "hbt" 
  regex = /hbt{2,5}n/

  # Check if the input matches the regular expression
  if input =~ regex
    puts "#{input}"

  else
    puts "no match"

  end
end
