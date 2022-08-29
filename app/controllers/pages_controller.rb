class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @stage = Stage.where(date: Date.current).first
  end

  def info
  end

  def profile
    @leagues = League.where(user: current_user)
    @leagues_accepted = League.includes(:admissions).where(admissions: {status: "accepted", user: current_user})
    @admissions = Admission.includes(:league).where(league: {user_id: current_user})
  end

  def my_results
  end

  def rules
  end

  def about
  end

end
