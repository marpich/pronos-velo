class Rider < ApplicationRecord
  has_many :bets
  has_many :results

  riders = []
  Rider.all.each do |rider|
    riders << "#{rider.last_name} #{rider.first_name}"
  end
  RIDERS = riders
end
