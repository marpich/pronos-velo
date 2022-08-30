class LeaguesController < ApplicationController
  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.user = current_user
    if @league.save
      redirect_to users_dashboard-path
    else
      render :new
    end
  end

  def show
    @league = League.find(params[:id])
  end

  def index
    @leagues = League.all
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
