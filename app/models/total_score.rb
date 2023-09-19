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

  def self.get_user_total_score_for_one_race(user, race)
    TotalScore.where(user: user, race: race).first.yellow_jersey
  end
end
