class League < ApplicationRecord
  belongs_to :user
  has_one_attached :logo
  has_many :admissions, dependent: :destroy

  validates :name, :logo, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 3..30 }

  def accept_admissions?
    self.admissions.where(status: "accepted").count < 20
  end

  def where_name_or_username_is(name)
    sql_query = <<~SQL
      leagues.name ILIKE :query
      OR users.username ILIKE :query
    SQL
    League.joins(:user).where(sql_query, query: "%#{name}%")
  end

  def self.where_am_i(user)
    leagues = League.where(user: user)
    leagues_requested = League.includes(:admissions).where(admissions: {user: user})
    leagues + leagues_requested
  end

  def number_of_players
    self.admissions.where(status: "accepted").count + 1
  end
end
