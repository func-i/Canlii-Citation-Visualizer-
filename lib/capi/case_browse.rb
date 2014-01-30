require 'capi/delegate/case_identifier_object'
require 'capi/delegate/proceeding_metadata'

module Capi
  module CaseBrowse

    # => List cases within a database
      # client.list_cases_in_db("abgaa", resultCount: 5)
    # dates stored as YYYY-MM-DD
    # Date.today.to_s = 2013-11-12
    # Date.new(2013, 11, 01).to_s = 2013-11-01
    def list_cases_in_db(database_id, params = {})
      params[:offset]         ||= 0
      params[:resultCount]    ||= 10000
      params[:publshedBefore] ||= nil
      params[:publishedAfter] ||= nil
      @request.get(['caseBrowse', database_id], params)['cases']
    end

    # => Get metadata for a given case
      # client.case_metadata('skqb', '1997canlii11174')
    def case_metadata(database_id, case_id)
      query = @request.get ['caseBrowse', database_id, case_id]
      ProceedingMetadata.new(query)
    end

    # => Fetches cases from database
    def get_case_list(database_id, params = {})
      cases = list_cases_in_db(database_id, params)
      normalize_data(cases)
    end

    private

    def normalize_data(cases)
      cases.inject([]) do |acc, ele|
        acc << normalize_element(ele)
      end
    end

    def normalize_element(item)
      {
        "dbId"     => item["databaseId"],
        "id"       => item["caseId"]["en"] || item["caseId"]["fr"],
        "title"    => item["title"],
        "citation" => item["citation"]
      }
    end

    def delegate_case_type(attributes)
      attributes.inject([]) do |obj, ele|
        obj << CaseIdentifier.new(ele)
      end
    end
  end
end
