#We borrowed this from Yelp's sample APIs, available at https://github.com/Yelp/yelp-fusion/blob/master/fusion/ruby/sample.rb

# Place holders for Yelp Fusion's API key. Grab it
# from https://www.yelp.com/developers/v3/manage_app
require "json"
require "http"
require "optparse"
require 'pry'
require 'dotenv'

API_KEY = ENV['YELP_API_KEY']

# Constants, do not change these
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path


DEFAULT_BUSINESS_ID = "yelp-new-york"
DEFAULT_TERM = "karaoke"
DEFAULT_LOCATION = "New York, NY"
SEARCH_LIMIT = 5

def search_yelp(term, location)
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {
    term: term,
    location: location,
    limit: SEARCH_LIMIT
  }

  response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
  response.parse
end

def find_karaoke_places_near_location(location = "10001")
  search_yelp("karaoke",location.to_s)
end

def top_five_printer(hash)
  puts "
  Here are the top five spots in your area:
  "
  i = 0
  hash["businesses"].first(5).each do |business|
    i +=1
    puts "#{i}. #{business['name']}"
    business["location"]["display_address"].each do |address_line|
      puts address_line
    end
    puts "**********************
    "
  end
end
