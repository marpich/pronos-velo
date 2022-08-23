class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  def show
    @stage = Stage.find(params[:id])
    # if @stage.date == Date.current && Time.now < Time.now.middle_of_day
    if @stage.date == Date.current && Time.now
      @bet = Bet.new
    end
    @my_bets = Bet.where(user: current_user, stage: @stage)
    @players = User.includes(:bets).where(bets: {stage: @stage})
    @result = Result.new
  end
end
