require 'open-uri'
require 'capi/delegate/search_delegator'

module Capi
  module Search

    # => Search endpoint for cases and legislations
      # client.search_cases("R. v. Douglas", resultCount: 10)
    def search_cases(query, params = {})
      params[:offset] ||= 0
      params[:resultCount] ||= 10
      params[:fullText] = URI.parse(URI.encode(query))
      SearchDelegator.new(@request.get ['search'], params)
    end

  end
end
