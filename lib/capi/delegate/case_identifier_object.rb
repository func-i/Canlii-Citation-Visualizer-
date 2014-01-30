class CaseIdentifier
  attr_reader :database_id, :case_id

  def initialize(attributes)
    @database_id = attributes["databaseId"]
    @case_id     = attributes["caseId"]["en"] || attributes["caseId"]["fr"]
  end

end
