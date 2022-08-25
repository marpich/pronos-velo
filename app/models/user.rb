class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bets, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_one_attached :photo

  def display_score(stage)
    self.scores.where(stage: stage).first.points unless self.scores.where(stage: stage).empty?
  end

  def display_score_total(type = nil)
    total_score = 0
    self.scores.each do |score|
      if type == nil
        total_score += score.points
      elsif score.stage.stage_type == type
        total_score += score.points
      end
    end
    return total_score
  end

end
