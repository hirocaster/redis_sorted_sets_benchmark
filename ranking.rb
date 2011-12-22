#!/usr/bin/env ruby

require 'csv'
require 'redis'

key = 'rank'

redis = Redis.new

ranking = redis.zrevrange(key, 0, 4999)
ranking.each do |data|
  p redis.zrevrank(key, data).to_s + ':' + data.to_s + ':' +  redis.zscore(key, data).to_s
end
