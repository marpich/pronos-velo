class Stage < ApplicationRecord
  belongs_to :race
  has_many :bets, dependent: :destroy
  has_many :results, dependent: :destroy
  has_one_attached :image

  validates :bets, length: { maximum: 3 }
end
