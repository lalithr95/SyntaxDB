require 'net/http'
require 'uri'
require 'json'

module Synaxdb
  class Request
    attr_accessor :api
    def initalize
      @api = "https://syntaxdb.com/api/v1"
    end

    def self.send_request(options = {}, endpoint)
      url = @api + endpoint + "?"
      options.each do |key, value|
        url += key.to_s + "=" + value.to_s
      end

      uri = URI.parse(@api)
      header = {
        'Content-Type' => 'text/json'
      }

      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri, header)

      response = http.request(request)
      return response.to_json
    end
  end
end
