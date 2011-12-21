#!/usr/bin/env ruby

require 'csv'

CSV.open('data.csv', 'w') do |writer|
  for i in 1..100000
    writer << [i, rand(99999)]
  end
end
