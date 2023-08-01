class Race < ApplicationRecord
  has_many :stages, dependent: :destroy
  after_create :total_score_initialization_for_each_player

  def total_score_initialization_for_each_player
    User.all.each do |player|
      TotalScore.create!(
        race: Race.last,
        user: player
      )
    end
  end
end
