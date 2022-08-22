class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @stage = Stage.where(date: Date.current).first
  end

  def info
  end

  def profile
  end

  def my_results
  end

  def rules
  end

  def about
  end

end
