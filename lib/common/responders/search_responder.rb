module Common
  module Responders
    module SearchResponder

      def initialize(*)
        super
        @resource = search(@resource, query) if searching?
      end

      private
      def search(resource, query = {})
        fuzzy? ? (resource.fuzzy_search query, exclusive?) : (resource.basic_search query, exclusive?)
      end

      def searching?
        controller.params.include?(:search) && controller.params[:search].is_a?(Hash)
      end

      def query
        controller.params[:search][:query]
      end

      def fuzzy?
        controller.params[:search][:_fuzzy] == '1'
      end

      def exclusive?
        (controller.params[:search][:_operator] =~ /OR/i) == false
      end
    end
  end
end

Common::Responder.send :prepend, Common::Responders::SearchResponder
