class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  def show
    @stage = Stage.find(params[:id])
    if @stage.date == Date.current && Time.now < Time.now.middle_of_day
      @bet = Bet.new
    end
    @bets = Bet.where(user: current_user, stage: @stage)
  end
end
