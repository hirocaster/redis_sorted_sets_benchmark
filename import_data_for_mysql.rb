#!/usr/bin/env ruby

require 'csv'
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

CSV.open('data.csv', 'r') do |rows|
  rows.each do |row|
    data = Ranking.new
    data.userid = row[0]
    data.score = row[1]
    data.save
  end
end
