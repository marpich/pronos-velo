class Score < ApplicationRecord
  belongs_to :stage
  belongs_to :user
end
