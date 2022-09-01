class AdmissionsController < ApplicationController
  def create
    @admission = Admission.new
    @admission.user = current_user
    @admission.status = "pending"
    @admission.league = League.find(params[:league_id])
    if @admission.save
      redirect_to users_dashboard_path
    else
      flash[:alert] = "Le peloton est complet!"
      redirect_to leagues_path
   end
  end

  def destroy
    @admission = Admission.find(params[:id])
    @admission.destroy
    redirect_to users_dashboard_path
  end

  def accept
    @admission = Admission.find(params[:id])
    @admission.status = "accepted"
    if @admission.save
      redirect_to users_dashboard_path(choice: "my_requests")
    else
      flash[:alert] = "Le peloton est complet!"
      redirect_to leagues_path
    end
  end

  def reject
    @admission = Admission.find(params[:id])
    @admission.status = "rejected"
    @admission.save
    redirect_to users_dashboard_path(choice: "my_requests")
  end

  private

end
