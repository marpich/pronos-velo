class TotalScore < ApplicationRecord
  belongs_to :race
  belongs_to :user

  def update_yellow_jersey
    self.yellow_jersey += self.user.scores.last.points
    self.save!
  end

  def update_green_jersey
    self.green_jersey += self.user.scores.last.points
    self.save!
  end

  def update_polka_dot_jersey
    self.polka_dot_jersey += self.user.scores.last.points
    self.save!
  end
end
