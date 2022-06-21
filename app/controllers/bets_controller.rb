class BetsController < ApplicationController
  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.user = current_user
    @bet.stage = Stage.find(params[:stage_id])
  end

  def index
    @bets = Bet.all
  end

  private
  def bet_params
    params.require(:bet).permit(:position, :rider_id)
  end

end
