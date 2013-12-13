class SearchLegislationObject

  attr_reader :database_id, :legislation_id, :citation, :title, :type

  def initialize(attr)
    @legislation_id = attr["legislationId"]
    @database_id    = attr["databaseId"]
    @citation       = attr["citation"]
    @title          = attr["title"]
    @type           = attr["type"]
  end

end
