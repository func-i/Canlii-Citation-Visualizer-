CaseNetwork::App.controllers :cases do

  get :index, :map => '/' do
    client = Capi::Client.new(ENV["CANLII_API_KEY"])
    @kase_citations = client.list_case_citations('csc-scc', '2011scc47')
    render 'cases/index'
  end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end


end
