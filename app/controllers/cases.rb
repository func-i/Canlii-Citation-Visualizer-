CaseNetwork::App.controllers :cases do
  set :client, Capi::Client.new(ENV["CANLII_API_KEY"])
  set :scc_cases, settings.client.get_case_list('csc-scc', resultCount: 50)

  get :index, :map => '/' do
    # @scc_cases = settings.client.get_case_list("csc-scc", resultCount: 25)
    @case_names = settings.scc_cases.map { |i| i["title"] }

    # random_scc = settings.client.get_case_list('csc-scc', resultCount: 10).sample
    # base_kase  = settings.client.case_metadata(random_scc.database_id, random_scc.case_id)

    # base_kase  = settings.client.case_metadata("csc-scc", "2011scc47")
    # citing_to  = settings.client.list_case_citations_tease(base_kase.dbId, base_kase.id)
    # cited_by   = settings.client.list_cases_cited_tease(base_kase.dbId, base_kase.id)

    # @hash_tree = transform_to_json(base_kase, citing_to, cited_by)
    # @json_tree = @hash_tree.to_json
    render 'cases/index'
  end

  post :index, :map => '/' do
    case_title = params["case"]
    selected_case = settings.scc_cases.select { |item| item["title"] == case_title }
    render 'cases/index'
  end

end
