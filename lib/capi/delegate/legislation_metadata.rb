class LegislationMetadata < AbstractMetadata

  attr_reader :database, :id, :url, :title, :citation, :language, :type,
    :date_scheme, :start_date, :end_date, :repealed, :content

  def initialize(attributes, database_id)
    @database    = database_id
    @id          = attributes['legislationId']
    @url         = attributes['url']
    @title       = attributes['title']
    @citation    = attributes['citation']
    @language    = attributes['language']
    @type        = attributes['type']
    @date_scheme = attributes['dateScheme']
    @start_date  = attributes['startDate']
    @end_date    = attributes['endDate']
    @repealed    = attributes['repealed']
    @content     = attributes['content']
  end

end
