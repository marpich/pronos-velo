require "open-uri"

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
  before_create :assign_photo
  after_create :total_score_initialization

  def total_score_initialization
    TotalScore.create!(
      race: Race.last,
      user: self
    )
  end

  def display_score(stage)
    self.scores.where(stage: stage).first.points unless self.scores.where(stage: stage).empty?
  end

  def self.accepted_in_league(league, type, race)
    owner = User.includes(:leagues).where(leagues: { id: league.id })
    accepted_users = User.includes(:admissions).where(admissions: { league: league, status: "accepted" })
    all_users = owner + accepted_users
    players = []
    all_users.each do |user|
      case type
      when "yellow_jersey"
        players << [user, TotalScore.where(user: user, race: race).first.yellow_jersey]
      when "green_jersey"
        players << [user, TotalScore.where(user: user, race: race).first.green_jersey]
      when "polka_dot_jersey"
        players << [user, TotalScore.where(user: user, race: race).first.polka_dot_jersey]
      end
    end
    players.sort_by { |player| player[1] }.reverse
  end

  def set_admin
    self.admin = true
    self.save!
  end

  private
  def assign_photo
    return if photo.attached?

    photoavatar = URI.open('https://res.cloudinary.com/dv67de4qe/image/upload/v1654783466/avatar_cwi0wm.jpg')
    photo.attach(io: photoavatar, filename: 'avatar.png', content_type: 'image/png')
  end
end
