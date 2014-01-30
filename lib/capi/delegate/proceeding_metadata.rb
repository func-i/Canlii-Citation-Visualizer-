require_relative 'abstract_metadata'

class ProceedingMetadata < AbstractMetadata

  attr_reader :id, :dbId, :title, :href, :date

  def initialize(attributes)
    @id    = attributes['caseId']
    @dbId  = attributes['databaseId']
    @title = attributes['title']
    @href  = attributes['url']
    @date  = attributes['decisionDate']
  end

end
