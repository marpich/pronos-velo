class ResultsController < ApplicationController
before_action :authenticate_admin, only: [:new, :create]

  def index
    @results = Result.includes(:stage).where(stage: {race: Race.last}).group_by(&:stage)
    @stage = Stage.where(date: Date.current).first
    @result = Result.where(stage: @stage)
  end

  def new
    @stage = Stage.find(params[:stage_id])
  end

  def create
    @stage = Stage.find(params[:stage_id])
    if result_params['rider_1'] == '' || result_params['rider_2'] == '' || result_params['rider_3'] == ''
      flash[:alert] = "Le résultat doit contenir trois coureurs"
      render 'stages/show'
    else
      # first result
      bib = result_params["rider_1"].split.first.to_i
      first_result = create_result(1, bib)

      # second result
      bib = result_params["rider_2"].split.first.to_i
      second_result = create_result(2, bib)

      # third result
      bib = result_params["rider_3"].split.first.to_i
      third_result = create_result(3, bib)

      if first_result && second_result && third_result
        score_calculation
        redirect_to stage_path(@stage), notice: 'Résultat pris en compte !'
      else
        result.where(user: current_user, stage: @stage).destroy_all
        flash[:alert] = "Vous ne pouvez choisir un coureur qu'une seule fois !"
        render "stages/show"
      end
    end
  end

  private

  def authenticate_admin
    redirect_to root_path, alert: "Accès refusé" unless
    current_user.admin?
  end

  def result_params
    params.permit(:rider_1, :rider_2, :rider_3)
  end

  def create_result(position, bib)
    result = Result.new
    result.result_position = position
    result.stage = @stage
    result.rider = Rider.where(bib: bib).first
    result.save!
  end

  def score_calculation
    first_result_rider = Result.where(stage: @stage, result_position: 1).first.rider
    second_result_rider = Result.where(stage: @stage, result_position: 2).first.rider
    third_result_rider = Result.where(stage: @stage, result_position: 3).first.rider

    players = User.includes(:bets).where(bets: {stage: @stage}).all

    players.each do |player|
      first_bet_rider = Bet.where(user: player, stage: @stage, position: 1).first.rider
      second_bet_rider = Bet.where(user: player, stage: @stage, position: 2).first.rider
      third_bet_rider = Bet.where(user: player, stage: @stage, position: 3).first.rider
      score = Score.new(stage: @stage, user: player)
      score.compute!(first_bet_rider, second_bet_rider, third_bet_rider, first_result_rider, second_result_rider, third_result_rider)
      score.double!(@stage)
      player.total_scores.where(total_scores: {race_id: @stage.race}).first.update_yellow_jersey
      if @stage.stage_type == "Plat"
        player.total_scores.where(total_scores: {race_id: @stage.race}).first.update_green_jersey
      elsif @stage.stage_type == "Montagne"
        player.total_scores.where(total_scores: {race_id: @stage.race}).first.update_polka_dot_jersey
      end
    end
  end
end
