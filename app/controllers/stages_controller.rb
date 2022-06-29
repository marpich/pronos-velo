class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  def show
    @stage = Stage.find(params[:id])
    @bet = Bet.new
  end
end
