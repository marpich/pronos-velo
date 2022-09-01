class Admission < ApplicationRecord
  belongs_to :user
  belongs_to :league

  validate :restrict_number_of_players, on: :save

  private
  def restrict_number_of_players
    if self.league.admissions.where(status: "accepted").present?
      unless self.league.admissions.where(status: "accepted").count < 1
        errors.add(:base, "The number of players for one league must be less than or equal to 20")
      end
    end
  end
end
