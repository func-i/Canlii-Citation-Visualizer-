CaseNetwork::App.helpers do

  def transform_to_json(base_kase, citing_to, cited_by)
    result_hash = base_kase.to_hash!
    result_hash.store("cited_by", cited_by)
    result_hash.store("citing_to", citing_to)
    result_hash
  end

end
