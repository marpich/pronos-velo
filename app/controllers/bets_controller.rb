class BetsController < ApplicationController
  def create
    @stage = Stage.find(params[:stage_id])

    # first bet
    last_name = bet_params["rider_1"].split.first
    first_bet = create_bet(1, last_name)

    # second bet
    last_name = bet_params["rider_2"].split.first
    second_bet = create_bet(2, last_name)

    # third bet
    last_name = bet_params["rider_3"].split.first
    third_bet = create_bet(3, last_name)

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

  def create_bet(position, last_name)
    bet = Bet.new
    bet.position = position
    bet.user = current_user
    bet.stage = @stage
    bet.rider = Rider.where(last_name: last_name).first
    bet.save
  end
end
