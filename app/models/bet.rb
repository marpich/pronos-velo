class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :stage
  belongs_to :rider
end
