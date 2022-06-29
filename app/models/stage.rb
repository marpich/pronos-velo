class Stage < ApplicationRecord
  has_many :bets
  has_many :results
  has_one_attached :image
end
