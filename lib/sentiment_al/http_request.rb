module SentimentAl
  class HttpRequest
    attr_accessor :uri, :protocol, :request

    def initialize(params)
      @uri = build_uri
      @protocol = ::Net::HTTP.new(uri.host, uri.port)
      @request = ::Net::HTTP::Post.new(uri.path, headers)

      request.body = params.to_json
      yield self if block_given?
    end

    def start
      protocol.use_ssl = true
      protocol.start{ |http| http.request(request) }
    end

    private

    def build_uri
      URI("#{sentim_api_url}/api/v1/")
    end

    def headers
      { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    end

    def sentim_api_url
      'https://sentim-api.herokuapp.com'
    end
  end
end