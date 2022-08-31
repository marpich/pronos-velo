class RidersController < ApplicationController
  def index
    @riders = Rider.all.group_by(&:team)
  end
end
