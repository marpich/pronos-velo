class AdmissionsController < ApplicationController
  def create
    @admission = Admission.new
    @admission.user = current_user
    @admission.status = "pending"
    @admission.league = League.find(params[:league_id])
    @admission.save!
    redirect_to users_dashboard_path
  end

  def destroy
    @admission = Admission.find(params[:id])
    @admission.destroy
    redirect_to users_dashboard_path
  end

  def accept
    @admission = Admission.find(params[:id])
    @admission.status = "accepted"
    @admission.save
    redirect_to users_dashboard_path(choice: "my_requests")
  end

  def reject
    @admission = Admission.find(params[:id])
    @admission.status = "rejected"
    @admission.save
    redirect_to users_dashboard_path(choice: "my_requests")
  end

  private

end
