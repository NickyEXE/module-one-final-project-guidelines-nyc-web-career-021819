require 'dotenv/load'
require 'bundler'
#require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest_client'
require 'uri'

Bundler.require


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = false
require_all 'lib'
require_all 'cli'
