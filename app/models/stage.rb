class Stage < ApplicationRecord
  has_many :bets
  has_one_attached :image
end
