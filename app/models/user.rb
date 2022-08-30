class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :leagues, dependent: :destroy
  has_many :bets, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_many :admissions, dependent: :destroy
  has_many :total_scores, dependent: :destroy
  has_one_attached :photo

  def display_score(stage)
    self.scores.where(stage: stage).first.points unless self.scores.where(stage: stage).empty?
  end
end
