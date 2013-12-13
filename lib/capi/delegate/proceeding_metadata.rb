require_relative 'abstract_metadata'

class ProceedingMetadata < AbstractMetadata

  attr_reader :canlii_case_id, :canlii_database_id, :title, :external_url,
    :canlii_citation, :language, :docket_number, :decision_date

  def initialize(attributes)
    @canlii_case_id     = attributes['caseId']
    @canlii_database_id = attributes['databaseId']
    @title              = attributes['title']
    @external_url       = attributes['url']
    @canlii_citation    = attributes['citation']
    @language           = attributes['language']
    @docket_number      = attributes['docketNumber']
    @decision_date      = attributes['decisionDate']
  end

end
