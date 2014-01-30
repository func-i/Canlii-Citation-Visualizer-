CaseNetwork::App.controllers :cases do
  set :client, Capi::Client.new(ENV["CANLII_API_KEY"])

  get :index, :map => '/' do
    # random_scc = settings.client.get_case_list('csc-scc', resultCount: 10).sample
    # base_kase  = settings.client.case_metadata(random_scc.database_id, random_scc.case_id)

    base_kase  = settings.client.case_metadata("csc-scc", "2011scc47")
    citing_to  = settings.client.list_case_citations_tease(base_kase.dbId, base_kase.id)
    cited_by   = settings.client.list_cases_cited_tease(base_kase.dbId, base_kase.id)

    @tree_hash = transform_to_json(base_kase, citing_to, cited_by)
    gon.tree = @tree_hash
    render 'cases/index'
  end

end
