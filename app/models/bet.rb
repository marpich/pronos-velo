class Bet < ApplicationRecord
  POSITIONS = ["1", "2", "3"]

  belongs_to :user
  belongs_to :stage
  belongs_to :rider

  validates :user_id, uniqueness: { scope: [:stage_id, :position],
    message: "Vous ne pouvez parier qu'une seule fois" }

  validates :user_id, uniqueness: { scope: [:stage_id, :rider_id],
    message: "Vous ne pouvez choisir un coureur qu'une seule fois pour la même étape"
  }

  # validates :user_id, length: { maximum: 3}, { scope: :stage_id,
  #   message: "Vous ne pouvez parier que 3 fois pour une étape"
  # }

end
