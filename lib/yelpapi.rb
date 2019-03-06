# # Place holders for Yelp Fusion's API key. Grab it
# # from https://www.yelp.com/developers/v3/manage_app
# require "json"
# require "http"
# require "optparse"
# require 'pry'
#

#
# # Constants, do not change these
# API_HOST = "https://api.yelp.com"
# SEARCH_PATH = "/v3/businesses/search"
# BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
#
#
# DEFAULT_BUSINESS_ID = "yelp-new-york"
# DEFAULT_TERM = "karaoke"
# DEFAULT_LOCATION = "New York, NY"
# SEARCH_LIMIT = 5
#
# def search(term, location)
#   url = "#{API_HOST}#{SEARCH_PATH}"
#   params = {
#     term: term,
#     location: location,
#     limit: SEARCH_LIMIT
#   }
#
#   response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
#   response.parse
# end
#
# search("karaoke", 10001)
