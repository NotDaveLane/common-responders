require "common/responders/display_resource_on_put_delete_responder"
require "common/responders/http_cache_responder"
require "common/responders/ids_filter_responder"
require "common/responders/nested_association_responder"
require "common/responders/pagination_responder"
require "common/responders/sort_responder"
require "common/responders/version"
require "responders/flash_responder"

module Common
  class Responder
    prepend Common::Responders::PaginationResponder
    prepend Common::Responders::IdsFilterResponder
    prepend Common::Responders::SortResponder
    prepend Common::Responders::NestedAssociationResponder
    prepend Common::Responders::DisplayResourceOnPutDeleteResponder
    include Common::Responders::HttpCacheResponder
    include ::Responders::FlashResponder

    def initialize(*)
      super
      options[:location] = nil if format == :json
    end

    def to_format
      validate!
      if errors.any?
        display({ errors: errors }, status: 400)
      else
        super
      end
    end

    def validate!
    end

    def json_resource_errors
      { errors: resource.errors.full_messages }
    end

    private
    def errors
      @_errors ||= []
    end
  end
end
