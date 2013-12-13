require 'capi/search'
require 'capi/database'
require 'capi/case_browse'
require 'capi/case_citator'
require 'capi/legislation_browse'

module Capi
  class Client
    include Capi::Search
    include Capi::Database
    include Capi::CaseBrowse
    include Capi::CaseCitator
    include Capi::LegislationBrowse

    # Capi::Client.new(ENV["CANLII_API_KEY"])
    def initialize(api_key, api_version = 'v1', language = 'en')
      api_key = api_key
      @request = Capi::Request.new(api_version, language)
      @request.set_auth(api_key)
    end
  end
end
