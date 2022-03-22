class Concept < ApplicationRecord
  include ConceptName

  belongs_to :article

  validates :concept_id, presence: true
end
