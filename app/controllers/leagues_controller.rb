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
    @my_leagues = leagues + leagues_requested
    @users = User.includes(:total_scores).where(total_scores: {race: Stage.first.race}).order("total_scores.#{params[:type]} DESC")
  end

  def index
    if params[:query].present?
      sql_query = <<~SQL
        leagues.name ILIKE :query
        OR users.username ILIKE :query
      SQL
      @leagues = League.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @leagues = League.all
    end
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
