CaseNetwork::App.helpers do

  def transform_to_nodes(base_kase, citings)
    nodes = []

    nodes << convert_origin(base_kase)

    citings['citingCases'].each_with_index do |item, index|
      nodes << convert_to_node(item, index)
    end

    edges = generate_edges

    [nodes, edges]
  end

  def convert_origin(kase)
    {
      "id"    => 0,
      "label" => kase.title,
      "title" => kase.canlii_case_id
    }
  end

  def convert_to_node(item, idx)
    result = {}
    result["id"] = idx + 1
    result['label'] = item['title']
    result["title"] = item['caseId']['en'] || item['caseId']['fr']
    result
  end

  # shitty hardcoded edges
  def generate_edges
    edges = [
      {'from' => 0, 'to' => 1},
      {'from' => 0, 'to' => 2},
      {'from' => 0, 'to' => 3},
      {'from' => 0, 'to' => 4},
      {'from' => 0, 'to' => 5},
      {'from' => 0, 'to' => 6},
      {'from' => 0, 'to' => 7},
      {'from' => 0, 'to' => 8},
      {'from' => 0, 'to' => 9},
      {'from' => 0, 'to' => 10},
      {'from' => 0, 'to' => 11},
      {'from' => 0, 'to' => 12},
      {'from' => 0, 'to' => 13},
      {'from' => 0, 'to' => 14},
      {'from' => 0, 'to' => 15},
      {'from' => 0, 'to' => 16},
      {'from' => 0, 'to' => 17},
      {'from' => 0, 'to' => 18},
      {'from' => 0, 'to' => 19},
      {'from' => 0, 'to' => 20}
    ]
  end

end
