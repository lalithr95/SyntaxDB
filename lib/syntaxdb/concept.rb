require 'request'

module Syntaxdb
  class Concept
    attr_accessor :concept_id, :concept_permalink

    def initialize(concept_id = nil, permalink = nil)
      @concept_id = concept_id
      @concept_permalink = permalink
    end

    class << self

      def search
      end

      def all(options = {})
        Request.send_request(options, '/concepts')
      end

      def find(options = {})
        @concept_id = options[:concept_id]
        if @concept_id
          options.delete(:concept_id)
          Request.send_request(options, "/concepts/#{@concept_id}")
        end
      end

      def language_concepts(options = {})
        @concept_permalink = options[:concept_permalink]
        language_permalink = options[:language_permalink]
        if language_permalink
          options.delete(:language_permalink)
          if @concept_permalink
            options.delete(:concept_permalink)
            Request.send_request(options, "/languages/#{language_permalink}/concepts/#{@concept_permalink}")
          else
            Request.send_request(options, "/languages/#{language_permalink}/concepts")
          end
        end
      end

      def search_concepts(options = {})
        language_permalink = options[:language_permalink]
        if language_permalink
          options.delete(:language_permalink)
          Request.send_request(options, "/languages/#{language_permalink}/concepts/search")
        end
      end

      def find_category_concepts(options = {})
        language_permalink = options[:language_permalink]
        category_id = options[:category_id]
        if language_permalink && category_id
          options.delete(:category_id)
          options.delete(:language_permalink)
          Request.send_request(options, "/languages/#{language_permalink}/categories/#{category_id}/concepts")
        end
      end
    end

  end
end
