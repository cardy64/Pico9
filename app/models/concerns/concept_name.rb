module ConceptName
  extend ActiveSupport::Concern

# gets concept info
  def gci

    concepts_list = JSON.parse(File.read('public/textfiles/concepts.json'))

    concepts_list["result"].each do |current_concept|
      if current_concept["id"] == concept_id
        current_title = current_concept["title"]
        if current_title == nil
          current_title = "Could not find concept name"
        end
        current_cluster = current_concept["Cluster"]
        if current_cluster == nil
          current_cluster = "Could not find cluster name"
        end
        current_subject_id = current_concept["subject_id"]
        if current_subject_id == nil
          current_subject_id = -1
        end
        return ConceptInfo.new(concept_id,current_title,current_cluster,current_subject_id)
      end
    end
    return ConceptInfo.new(concept_id,"CONCEPT NOT IN concepts.json",":(",-1)
  end

  class ConceptInfo
     def initialize(input_id, input_name, input_cluster_name, input_subject_id)
        @cust_id = input_id
        @cust_name = input_name
        @cust_cluster_name = input_cluster_name
        @cust_subject_id = input_subject_id
     end

    def id
       @cust_id
    end

    def name
       @cust_name
    end

    def cluster_name
       @cust_cluster_name
    end

    def subject_id
       @cust_subject_id
    end
  end
end
