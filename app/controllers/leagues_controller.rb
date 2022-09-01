class LeaguesController < ApplicationController
  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.user = current_user
    if @league.save
      redirect_to users_dashboard_path
    else
      render :new
    end
  end

  def show
    @league = League.find(params[:id])
    leagues = League.where(user: current_user)
    leagues_requested = League.includes(:admissions).where(admissions: {user: current_user})
    @my_leagues = League.where_am_i(current_user)
    @users = User.includes(:total_scores).where(total_scores: {race: Stage.first.race}).order("total_scores.#{params[:type]} DESC")
    @admission = @league.admissions.where(user: current_user).first
  end

  def index
    @leagues = params[:query].present? ? League.where_name_or_username_is(params[:query]) : League.all
  end

  def edit
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])
    @league = League.update(league_params)
    redirect_to league_path(@league)
  end

  def destroy
    @league = League.find(params[:id])
    @league.delete
    redirect_to users_dashboard_path
  end

  private

  def league_params
    params.require(:league).permit(:name, :logo)
  end
end
