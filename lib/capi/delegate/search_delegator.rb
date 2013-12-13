require 'capi/delegate/search_proceeding_object'
require 'capi/delegate/search_legislation_object'

class SearchDelegator

  attr_reader :total_hits, :formatted_results

  def initialize(attr)
    @total_hits        = attr["resultCount"]
    @formatted_results = delegate_type attr["results"]
  end

  private

    def delegate_type(elements)
      results = []
      elements.each do |element|
        if element.key?("case")
          results << SearchProceedingObject.new(element['case'])
        else
          results << SearchLegislationObject.new(element['legislation'])
        end
      end
      results
    end

end
