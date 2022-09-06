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

  def self.accepted_in_league(league, type)
    owner = User.includes(:leagues).where(leagues: { id: league.id })
    accepted_users = User.includes(:admissions).where(admissions: { league: league, status: "accepted" })
    all_users = owner + accepted_users
    players = []
    all_users.each do |user|
      case type
      when "yellow_jersey"
        players << [user, user.total_scores.first.yellow_jersey]
      when "green_jersey"
        players << [user, user.total_scores.first.green_jersey]
      when "polka_dot_jersey"
        players << [user, user.total_scores.first.polka_dot_jersey]
      end
    end
    players
  end
end
