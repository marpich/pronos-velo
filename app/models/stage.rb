class Stage < ApplicationRecord
  has_many :bets
  has_many :results
  has_one_attached :image

  validates :bets, length: { maximum: 3 }
end
