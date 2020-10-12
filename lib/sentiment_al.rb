require "sentiment_al/version"
require "net/http"
require "json"

# => * 
require "sentiment_al/http_request"
require "sentiment_al/service"

# => load sentiment_al object
def sentiment_al
  SentimentAl::Service
end