class ResultsController < ApplicationController
  def index
    @results = Result.all
  end

  def new
    @result = Result.new
    @riders = Rider.all
  end

  def create
    raise
    last_name = result_params["rider"].split.first
    number = result_params["result_position"].to_i
    @result = Result.new
    @result.rider = Rider.where(last_name: last_name).first
  end

  private
  def result_params
    params.require(:result).permit(:rider, :stage, :result_position)
  end
end
