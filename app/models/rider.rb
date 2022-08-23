class Rider < ApplicationRecord
  has_many :bets
  has_many :results

  riders = []
  Rider.all.sort_by(&:bib).each do |rider|
    riders << "#{rider.bib} - #{rider.last_name} #{rider.first_name}"
  end
  RIDERS = riders
end
