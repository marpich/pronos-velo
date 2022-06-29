class BetsController < ApplicationController

  def create
    @stage = Stage.find(params[:stage_id])
    # @user = current_user
    # @bet.user = @user
    stage_number = bet_params["stage"].to_i

    #number one
    last_name = bet_params["rider_1"].split.first
    winner_rider = Bet.new(position: 1)
    winner_rider.stage = @stage
    winner_rider.rider = Rider.where(last_name: last_name).first
    winner_rider.save

    #second
    last_name = bet_params["rider_2"].split.first
    second_rider = Bet.new(position: 2)
    second_rider.stage = @stage
    second_rider.rider = Rider.where(last_name: last_name).first
    second_rider.save

    #third
    last_name = bet_params["rider_3"].split.first
    third_rider = Bet.new(position: 3)
    third_rider.stage = @stage
    third_rider.rider = Rider.where(last_name: last_name).first
    third_rider.save
  end

  def index
    @bets = Bet.all
  end

  private
  def bet_params
    params.permit(:rider_1, :rider_2, :rider_3)
  end

end
