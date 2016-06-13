require 'net/http'
require 'uri'
require 'json'

module Syntaxdb
  class Request
    attr_accessor :api

    def initalize
      @api = "https://syntaxdb.com/api/v1"
    end

    def self.send_request(options = {}, endpoint)
      @api = "https://syntaxdb.com/api/v1" if @api.nil?
      url = @api + endpoint + "?"
      options.each do |key, value|
        url += key.to_s + "=" + value.to_s
      end

      uri = URI.parse(url)
      header = {
        'Content-Type' => 'text/json'
      }

      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri, header)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      response = http.request(request)
      JSON.parse(response.body)
    end
  end
end
