class Stage < ApplicationRecord
  has_many :results
  has_one_attached :image
end
