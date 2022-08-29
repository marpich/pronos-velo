class AdmissionsController < ApplicationController
  def create
    @admission = Admission.new
    @admission.user = current_user
    @admission.status = "pending"
    @admission.league = League.find(params[:league_id])
    @admission.save!
    redirect_to leagues_path
  end

  def destroy
    @admission = Admission.find(params[:id])
    @admission.destroy
    redirect_to leagues_path
  end

  def accept
    @admission = Admission.find(params[:id])
    @admission.status = "accepted"
    @admission.save
    redirect_to info_profile_path
  end

  def reject
    @admission = Admission.find(params[:id])
    @admission.status = "rejected"
    @admission.save
    redirect_to info_profile_path
  end

  private

end
