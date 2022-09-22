class Result < ApplicationRecord
  belongs_to :rider
  belongs_to :stage

  validates :rider_id, uniqueness: { scope: :stage_id,
    message: "Un coureur ne peut être sélectionné qu'une fois par étape"}
  validates :result_position, uniqueness: { scope: :stage_id,
    message: "Un seul résultat est possible par étape" }
end
