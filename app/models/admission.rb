class Admission < ApplicationRecord
  belongs_to :user
  belongs_to :league

  validate :restrict_number_of_players

  def accept!
    update(status: "accepted")
  end
  
  def accepted?
    status == "accepted"
  end

  private

  def restrict_number_of_players
    unless league.accept_admissions?
      errors.add(:base, "The number of players for one league must be less than or equal to 20")
    end
  end

end
