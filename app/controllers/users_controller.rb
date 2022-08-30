class UsersController < ApplicationController
  def dashboard
    @leagues = League.where(user: current_user)
    @leagues_requested = League.includes(:admissions).where(admissions: {user: current_user})
    @admissions = Admission.includes(:league).where(league: {user_id: current_user})
  end
end
