#!/usr/bin/env ruby

#Regular expression to match the pattern "hbt" 
puts ARGV[0].scan(/hbt{2,5}n/).join
