class ResultsController < ApplicationController
  def index
    @results = Result.all
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
  end

  private
  def result_params
    params.require(:result).permit(:rider, :stage, :result_position)
  end
end
