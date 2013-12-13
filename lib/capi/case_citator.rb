module Capi
  module CaseCitator

    # => Get a list of all cases CITING `case_id`
      # client.list_case_citations('csc-scc', '2011scc47')
    def list_case_citations(database_id, case_id)
      @request.get ['caseCitator', database_id, case_id, 'citingCases']
    end

    # => Get a maximum of 5 cases CITING `case_id`
      # client.list_case_citations_tease('csc-scc', '2011scc47')
    def list_case_citations_tease(database_id, case_id)
      @request.get ['caseCitatorTease', database_id, case_id, 'citingCases']
    end

    # => Get a list of all cases CITED BY `case_id`
      # client.list_cases_cited('csc-scc', '2011scc47')
    def list_cases_cited(database_id, case_id)
      @request.get ['caseCitator', database_id, case_id, 'citedCases']
    end

    # => Get a maximum of 5 cases CITED BY `case_id`
      # client.list_cases_cited_tease('csc-scc', '2011scc47')
    def list_cases_cited_tease(database_id, case_id)
      @request.get ['caseCitatorTease', database_id, case_id, 'citedCases']
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

  end
end
