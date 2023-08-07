class Rider < ApplicationRecord
  has_many :bets, dependent: :destroy
  has_many :results, dependent: :destroy
  belongs_to :race

  def self.get_all
    Rider.where(still_racing: true, race: Race.first).sort_by(&:last_name).map {|rider| "#{rider.bib} - #{rider.last_name} #{rider.first_name}"}
  end

  def self.get_teams
    teams = []
    Rider.where(race: Race.first).map do |rider|
      teams << "#{rider.team}" unless teams.include?(rider.team)
    end
    return teams.sort
  end
end
