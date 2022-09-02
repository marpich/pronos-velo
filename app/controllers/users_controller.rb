class UsersController < ApplicationController
  def dashboard
    @my_leagues = League.where_am_i(current_user)
    @my_admissions = Admission.includes(:league).where(league: {user_id: current_user}, status: "pending")
  end

  def account
  end
end
