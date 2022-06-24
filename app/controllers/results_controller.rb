class ResultsController < ApplicationController
  def index
    @results = Result.all
  end

  def new
    @result = Result.new
  end

  def create

    stage_number = result_params["stage"].to_i
    # vainqueur
    last_name = result_params["rider_1"].split.first
    winner_rider = Result.new(result_position: 1)
    winner_rider.stage = Stage.where(number: stage_number).first
    winner_rider.rider = Rider.where(last_name: last_name).first
    winner_rider.save

    # deuxième
    last_name = result_params["rider_2"].split.first
    second_rider = Result.new(result_position: 2)
    second_rider.stage = Stage.where(number: stage_number).first
    second_rider.rider = Rider.where(last_name: last_name).first
    second_rider.save

    # troisième
    last_name = result_params["rider_3"].split.first
    third_rider = Result.new(result_position: 3)
    third_rider.stage = Stage.where(number: stage_number).first
    third_rider.rider = Rider.where(last_name: last_name).first
    third_rider.save
  end

  private

  def result_params
    params.permit(:stage, :rider_1, :rider_2, :rider_3)
  end
end
