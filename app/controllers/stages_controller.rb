class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  def show
    @stage = Stage.find(params[:id])
    @previous_stage = Stage.where('id < ?', params[:id]).last
    @next_stage = Stage.where('id > ?', params[:id]).first
    if @stage.date == Date.current && Time.now < Time.now.middle_of_day
      @bet = Bet.new
    end
    @my_bets = Bet.where(user: current_user, stage: @stage)
    @result = Result.where(stage: @stage)
    @players = []
    my_players = []
    my_leagues = League.where_am_i(current_user)
    my_leagues.each do |league|
      players = User.accepted_in_league(league, "yellow_jersey")
      players.each do |player|
        my_players << player.first unless my_players.include?(player.first)
      end
    end
    all_players = User.includes(:bets).where.not(id: current_user.id).where(bets: {stage: @stage}).order(position: :asc)
    all_players.each do |player|
      @players << player if my_players.include?(player)
    end
  end
end
