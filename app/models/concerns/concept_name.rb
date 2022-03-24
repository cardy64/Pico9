module ConceptName
  extend ActiveSupport::Concern

  def get_concept_name?

    concepts_list = JSON.parse(File.read('public/textfiles/concepts.json'))

    concepts_list["result"].each do |current_concept|
      if current_concept["id"] == concept_id
        return current_concept["title"]
      end
    end
    return "Could not find concept"
  end

  def get_concept_cluster?

    concepts_list = JSON.parse(File.read('public/textfiles/concepts.json'))

    concepts_list["result"].each do |current_concept|
      if current_concept["id"] == concept_id
        return current_concept["Cluster"]
      end
    end
    return "Could not find cluster"
  end
end
