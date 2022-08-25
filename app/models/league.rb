class League < ApplicationRecord
  belongs_to :user
  has_one_attached :logo
  has_many :admissions, dependent: :destroy
end
