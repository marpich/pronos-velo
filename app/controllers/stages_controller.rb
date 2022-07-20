class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  def show
    @stage = Stage.find(params[:id])
    @stages = Stage.all
    @bet = Bet.new
    @bets = Bet.where(stage: @stage)
  end
end
