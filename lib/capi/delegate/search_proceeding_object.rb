class SearchProceedingObject

  attr_reader :database_id, :proceeding_id, :citation, :title

  def initialize(attr)
    @proceeding_id = attr["caseId"]["en"]
    @database_id   = attr["databaseId"]
    @citation      = attr["citation"]
    @title         = attr["title"]
  end

end
