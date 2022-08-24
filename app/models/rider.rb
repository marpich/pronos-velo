class Rider < ApplicationRecord
  has_many :bets, dependent: :destroy
  has_many :results, dependent: :destroy

  riders = []
  Rider.all.sort_by(&:bib).each do |rider|
    riders << "#{rider.bib} - #{rider.last_name} #{rider.first_name}"
  end
  RIDERS = riders
end
