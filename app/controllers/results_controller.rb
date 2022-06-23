class ResultsController < ApplicationController
  def index
    @results = Result.all
  end

  def new
    @result = Result.new
    @riders = Rider.all
  end

  def create

    # vainqueur
    last_name = result_params["rider_1"].split.first
    winner_rider = Result.new(result_position: 1)
    winner_rider.rider = Rider.where(last_name: last_name).first

    # deuxième
    last_name = result_params["rider_2"].split.first
    second_rider = Result.new(result_position: 2)
    second_rider.rider = Rider.where(last_name: last_name).first

    # troisième
    last_name = result_params["rider_3"].split.first
    third_rider = Result.new(result_position: 3)
    third_rider.rider = Rider.where(last_name: last_name).first
  end

  private

  def result_params
    params.permit(:rider_1, :rider_2, :rider_3)
  end
end
