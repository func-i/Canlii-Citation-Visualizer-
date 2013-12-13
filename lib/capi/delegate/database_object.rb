class DatabaseObject

  attr_reader :id, :jurisdiction, :name, :type

  def initialize(element)
    @id           = element['databaseId']
    @jurisdiction = element['jurisdiction']
    @name         = element['name']
    @type         = element['type'] || 'case'
  end

end
