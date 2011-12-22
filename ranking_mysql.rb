#!/usr/bin/env ruby

require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'mysql',
  :host => 'localhost',
  :username => 'root',
  :password => '',
  :database => 'ranking'
)

ActiveRecord::Base.pluralize_table_names = false

class Ranking < ActiveRecord::Base
end

ranking =  Ranking.find(:all, :order => 'score DESC', :limit => 5000)

i = 0
ranking.each do |data|
  p i.to_s + ':' + data.userid.to_s + ':' + data.score.to_s
  i += 1
end

