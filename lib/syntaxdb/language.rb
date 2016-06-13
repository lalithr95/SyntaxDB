require 'request'

module Syntaxdb
  class Language
    attr_accessor :language_permalink

    def initalize(language_permalink = nil)
      @language_permalink = language_permalink
    end
    
    class << self
      def all(options = {})
        Request.send_request(options, '/languages')
      end

      # params language_permalink
      def find(options = {})
        @language_permalink = options[:language_permalink]
        if @language_permalink
          options.delete(:language_permalink)
          Request.send_request(options, "/languages/#{@language_permalink}")
        end
      end

      # params language_permalink
      # Find categories by language_permalink
      def find_categories(options = {})
        @language_permalink = options[:language_permalink]
        if @language_permalink
          options.delete(:language_permalink)
          Request.send_request(options, "/languages/#{@language_permalink}/categories")
        end
      end

      # Find concepts by language_permalink and category
      def find_concepts(options = {})
        @language_permalink = options[:language_permalink]
        category_id = options[:category_id]
        if @language_permalink
          options.delete(:language_permalink)
          if category_id
            options.delete(:category_id)
            Request.send_request(options, "/languages/#{@language_permalink}/categories/#{category_id}/concepts")
          else
            Request.send_request(options, "/languages/#{@language_permalink}/concepts")
          end
        end
      end
    end
  end
end
