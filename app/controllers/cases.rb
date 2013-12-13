CaseNetwork::App.controllers :cases do

  get :index, :map => '/' do
    client = Capi::Client.new(ENV["CANLII_API_KEY"])
    @kase_citations = client.list_case_citations('csc-scc', '2011scc47')
    render 'cases/index'
  end

  # get :index, :map => '/application.js' do
  #   coffee :application
  # end

end
