require 'sqlite3'
require 'require_all'
require_relative '../lib/interactive.rb'
require_all 'lib'

DB = {:conn => SQLite3::Database.new('db/real_estate.db')}