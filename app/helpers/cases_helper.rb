# Helper methods defined here can be accessed in any controller or view in the application

CaseNetwork::App.helpers do

  $index = 2

  def transform_to_nodes(base_kase, citings)
    nodes = []

    nodes << convert_origin(base_kase)

    citings['citingCases'].each do |item|
      nodes << convert_to_node(item)
    end

    edges = generate_edges

    return [nodes, edges]
  end

  def convert_origin(kase)
    {
      "id"    => 1,
      "label" => kase.title,
      "title" => kase.canlii_case_id
    }
  end

  def convert_to_node(item)
    result = {}
    result["id"] = $index
    $index += 1
    result['label'] = item['title']
    result["title"] = item['caseId']['en'] || item['caseId']['fr']
    return result
  end

  def generate_edges
    edges = [
      {'from' => 1, 'to' => 2},
      {'from' => 1, 'to' => 3},
      {'from' => 1, 'to' => 4},
      {'from' => 1, 'to' => 5},
      {'from' => 1, 'to' => 6},
      {'from' => 1, 'to' => 7},
      {'from' => 1, 'to' => 8},
      {'from' => 1, 'to' => 9},
      {'from' => 1, 'to' => 10},
      {'from' => 1, 'to' => 11},
      {'from' => 1, 'to' => 12},
      {'from' => 1, 'to' => 13},
      {'from' => 1, 'to' => 14},
      {'from' => 1, 'to' => 15},
      {'from' => 1, 'to' => 16},
      {'from' => 1, 'to' => 17},
      {'from' => 1, 'to' => 18},
      {'from' => 1, 'to' => 19},
      {'from' => 1, 'to' => 20},
      {'from' => 1, 'to' => 21}
    ]
  end

end
