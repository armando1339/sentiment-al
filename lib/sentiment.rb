require "sentiment/version"
require "net/http"
require "json"

# => * 
require "sentiment/http_request"
require "sentiment/service"

# => load sentiment_al object
def sentiment_al
  Sentiment::Service
end