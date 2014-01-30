module Capi
  module CaseCitator

    # => Get a list of all cases CITING `case_id`
      # client.list_case_citations('csc-scc', '2011scc47')
    def list_case_citations(database_id, case_id)
      @request.get ['caseCitator', database_id, case_id, 'citingCases']
    end

    # => Get a list of all cases CITED BY `case_id`
      # client.list_cases_cited('csc-scc', '2011scc47')
    def list_cases_cited(database_id, case_id)
      @request.get ['caseCitator', database_id, case_id, 'citedCases']
    end

    # => Get a list of all legislations CITED BY `case_id`
      # client.list_cited_legislations('csc-scc', '2011scc47')
    def list_cited_legislations(database_id, case_id)
      @request.get ['caseCitator', database_id, case_id, 'citedLegislations']
    end

    # => Get a maximum of 5 legislations CITED BY `case_id`
      # client.list_cited_legislations_tease('csc-scc', '2011scc47')
    def list_cited_legislations_tease(database_id, case_id)
      @request.get ['caseCitatorTease', database_id, case_id, 'citedLegislations']
    end

    # => Get a maximum of 5 cases CITING `case_id`
      # client.list_case_citations_tease('csc-scc', '2011scc47')
    def list_case_citations_tease(database_id, case_id)
      query = @request.get ['caseCitatorTease', database_id, case_id, 'citingCases']
      result_array = query["citingCases"]
      result_array.length > 0 ? convert_to_hash(result_array) : []
    end

    # => Get a maximum of 5 cases CITED BY `case_id`
      # client.list_cases_cited_tease('csc-scc', '2011scc47')
    def list_cases_cited_tease(database_id, case_id)
      query = @request.get ['caseCitatorTease', database_id, case_id, 'citedCases']
      result_array = query["citedCases"]
      result_array.length > 0 ? convert_to_hash(result_array) : []
    end

    private

    # returns arrray of case hash objects?
    def convert_to_hash(iterable)
      iterable.inject([]) do |acc, ele|
        acc << convert_element(ele)
      end
    end

    # fetch metadata and normalize
    def convert_element(ele)
      db_id, case_id = ele["databaseId"], (ele["caseId"]["en"] || ele["caseId"]["fr"])
      metadata = @request.get ['caseBrowse', db_id, case_id]
      {
        "title" => metadata["title"],
        "id" => metadata["caseId"],
        "dbId" => metadata["databaseId"],
        "href" => metadata["url"],
        "date" => metadata["decisionDate"]
      }
    end
  end
end
