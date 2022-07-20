class BetsController < ApplicationController

  def create
    @stage = Stage.find(params[:stage_id])
    stage_number = bet_params["stage"].to_i

    # first bet
    last_name = bet_params["rider_1"].split.first
    create_bet(1, last_name)

    #second bet
    last_name = bet_params["rider_2"].split.first
    create_bet(2, last_name)

    # third bet
    last_name = bet_params["rider_3"].split.first
    create_bet(3, last_name)
    # third_rider = Bet.new(position: 3)
    # third_rider.user = current_user
    # third_rider.stage = @stage
    # third_rider.rider = Rider.where(last_name: last_name).first
    # third_rider.save!
    redirect_to stage_path(@stage)
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
    bet.save!
  end
end
