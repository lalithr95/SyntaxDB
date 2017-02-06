require 'syntaxdb/request'

module Syntaxdb
  class Category
    attr_accessor :category_id
    def initalize(category_id)
      @category_id = category_id
    end

    class << self
      def language_categories(options = {})
        language_permalink = options[:language_permalink]
        if language_permalink
          Syntaxdb::Request.send_request(options, "/languages/#{language_permalink}/categories")
        end
      end

      def concepts_category(options = {})
        language_permalink = options[:language_permalink]
        @category_id = options[:category_id]
        if @category_id && language_permalink
          Syntaxdb::Request.send_request(options, "/languages/#{language_permalink}/categories/#{@category_id}/concepts")
        end
      end

    end

  end
end
