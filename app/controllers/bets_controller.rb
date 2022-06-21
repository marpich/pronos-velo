class BetsController < ApplicationController

  def create
    raise
    name = params["bet"]["rider"].split.first
    number = params["bet"]["position"].to_i
    @stage = Stage.find(params[:stage_id])
    @rider = Rider.where(last_name: name).first
    @bet = Bet.new(position: number)
    @bet.user = current_user
    @bet.stage = @stage
    @bet.rider = @rider
    if @bet.save
      redirect_to stage_path(@stage)
    else
      render 'stages/show'
   end
  end

  def index
    @bets = Bet.all
  end

  private
  def bet_params
    params.require(:bet).permit(:position, :rider, :position, :rider, :position, :rider)
  end

end
