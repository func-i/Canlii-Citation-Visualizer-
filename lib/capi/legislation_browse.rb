require 'capi/delegate/legislation_identifier_object'
require 'capi/delegate/legislation_metadata'

module Capi
  module LegislationBrowse

    # => List all legislations within a database
      # client.list_legislations_in_db("onr", resultCount: 10)
    def list_legislations_in_db(database_id, params = {})
      query = @request.get(['legislationBrowse', database_id])
      delegate_legislation_type(query)
    end

    # => Get metadata for a given legislation
      # client.legislation_metadata('car', 'si-2005-87')
    def legislation_metadata(database_id, legislation_id)
      result = @request.get ['legislationBrowse', database_id, legislation_id]
      LegislationMetadata.new(result, database_id)
    end

    private
    def delegate_legislation_type(attributes)
      result = attributes['legislations'].inject([]) do |obj, element|
        obj << LegislationIdentifier.new(element)
      end
    end
  end
end
