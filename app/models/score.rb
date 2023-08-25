class Score < ApplicationRecord
  belongs_to :stage
  belongs_to :user

  validates :user_id, uniqueness: { scope: [:stage_id],
    message: "Un seul score par étape pour chaque participant" }

  def compute!(first_bet_rider, second_bet_rider, third_bet_rider, first_result_rider, second_result_rider, third_result_rider)
    # On vérifie le premier bet et on incrémente le score
    if (first_bet_rider == first_result_rider)
      self.points += 5
    elsif (first_bet_rider == second_result_rider) || (first_bet_rider == third_result_rider)
      self.points += 1
    end
    # On vérifie le second bet et on incrémente le score
    if (second_bet_rider == second_result_rider)
      self.points += 3
    elsif (second_bet_rider == first_result_rider) || (second_bet_rider == third_result_rider)
      self.points += 1
    end
    # On vérifie le troisième bet et on incrémente le score
    if (third_bet_rider == third_result_rider)
      self.points += 2
    elsif (third_bet_rider == first_result_rider) || (third_bet_rider == second_result_rider)
      self.points += 1
    end

    # On ajoute des points si tiercé dans le mauvais ordre sans le vainqueur trouvé et limité à 5 pts
    if ((first_bet_rider == second_result_rider) || (first_bet_rider == third_result_rider)) && ((second_bet_rider == first_result_rider) || (second_bet_rider == third_result_rider)) && ((third_bet_rider == first_result_rider) || (third_bet_rider == second_result_rider))
      self.points += 2
    elsif (first_bet_rider == second_result_rider) && (second_bet_rider == first_result_rider) && (third_bet_rider == third_result_rider)
      self.points += 1
    end
    self.save!
  end

  def double!(stage)
    if (stage.stage_type == "Montagne")
      self.points *= 2
    end
    self.save!
  end

end
