#!/usr/bin/env ruby

#Regular expression to match "School" at the end of the string
puts ARGV[0].scan(/School/).join()
