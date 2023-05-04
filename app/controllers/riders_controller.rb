class RidersController < ApplicationController
  def index
    @riders = Rider.all.group_by(&:team)
  end

  def stop_racing
    @rider = Rider.find(params[:id])
    @rider.still_racing = false
    @rider.save
    redirect_to riders_path
  end
end
