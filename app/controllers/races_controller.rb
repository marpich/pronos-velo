class RacesController < ApplicationController
  def show
    @race = Race.find(params[:id])
    @league = League.find(params[:league_id])
    @my_leagues = League.where_am_i(current_user)
    @users = User.accepted_in_league(@league, params[:type], @race)
    @admission = @league.admissions.where(user: current_user).first
  end
end
