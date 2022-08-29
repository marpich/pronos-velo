class Race < ApplicationRecord
  has_many :stages, dependent: :destroy
end
