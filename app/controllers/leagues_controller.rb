class LeaguesController < ApplicationController

  def info
    @league = League.find(params[:id])
    @accepted_admissions = Admission.where(status: "accepted", league: @league)
    @my_admission = Admission.where(status: "accepted", user: current_user, league: @league).first
  end

  def index
    @leagues = params[:query].present? ? League.where_name_or_username_is(params[:query]) : League.all
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.user = current_user
    if @league.save!
      redirect_to users_dashboard_path(popup: true, league: @league.name)
    else
      render :new
    end
  end

  def show
    @league = League.find(params[:id])
    @my_leagues = League.where_am_i(current_user)
    @users = User.accepted_in_league(@league, params[:type])
    @admission = @league.admissions.where(user: current_user).first
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
