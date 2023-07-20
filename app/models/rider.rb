class Rider < ApplicationRecord
  has_many :bets, dependent: :destroy
  has_many :results, dependent: :destroy

  riders = []
  Rider.where(still_racing: true).sort_by(&:last_name).each do |rider|
    riders << "#{rider.bib} - #{rider.last_name} #{rider.first_name}"
  end
  riders
end
