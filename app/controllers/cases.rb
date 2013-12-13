CaseNetwork::App.controllers :cases do

  get :index, :map => '/' do

    client = Capi::Client.new(ENV["CANLII_API_KEY"])
    @base_kase = client.case_metadata('csc-scc', '2011scc47')

    @kases = client.list_case_citations(
      @base_kase.canlii_database_id,
      @base_kase.canlii_case_id
    )

    @nodes, @edges = transform_to_nodes(@base_kase, @kases)

    gon.nodes = @nodes
    gon.edges = @edges

    render 'cases/index'
  end

end
