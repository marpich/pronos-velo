class BetsController < ApplicationController
  def create
    @stage = Stage.find(params[:stage_id])

    # first bet
    bib = bet_params["rider_1"].split.first.to_i
    first_bet = create_bet(1, bib)

    # second bet
    bib = bet_params["rider_2"].split.first.to_i
    second_bet = create_bet(2, bib)

    # third bet
    bib = bet_params["rider_3"].split.first.to_i
    third_bet = create_bet(3, bib)

    if first_bet && second_bet && third_bet
      redirect_to stage_path(@stage), notice: 'Pari pris en compte !'
    else
      Bet.where(user: current_user, stage: @stage).destroy_all
      flash[:alert] = "Vous ne pouvez choisir un coureur qu'une seule fois !"
      render "stages/show"
    end
  end

  def index
    @bets = Bet.all
  end

  private

  def bet_params
    params.permit(:rider_1, :rider_2, :rider_3)
  end

  def create_bet(position, bib)
    bet = Bet.new
    bet.position = position
    bet.user = current_user
    bet.stage = @stage
    bet.rider = Rider.where(bib: bib).first
    bet.save!
  end
end
