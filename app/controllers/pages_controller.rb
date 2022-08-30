class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @stage = Stage.where(date: Date.current).first
  end

  def profile
  end

  def my_results
  end

  def rules
  end

  def leagues
  end
end
