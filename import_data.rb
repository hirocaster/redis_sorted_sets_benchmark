#!/usr/bin/env ruby

require 'csv'
require 'redis'

key = 'rank'

redis = Redis.new

# CSV.open('data.csv', 'r') do |rows|
#   rows.each do |row|
#     redis.zadd(key, row[1], row[0])
#   end
# end

# p redis.zcard key

ranking = redis.zrevrange(key, 0, 9)
# ranking = redis.zrevrange(key, 0, 9, :withscores => true)

# p ranking

ranking.each do |data|
  p redis.zrevrank(key, data).to_s + ':' + data.to_s + ':' +  redis.zscore(key, data).to_s
end

p '----------'

equal = redis.zrangebyscore(key, 99997, 99997)
equal.each do |data|
  p redis.zrevrank(key, data).to_s + ':' + data.to_s + ':' +  redis.zscore(key, data).to_s
end
