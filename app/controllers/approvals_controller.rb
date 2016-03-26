class ApprovalsController < ApplicationController

  include ApprovalsHelper

  before_action :authenticate_user!

  def new
    if current_user.vpr_admin? || current_user.kti_admin?
      @manuscript = Manuscript.find(params[:manuscript_id])
      @approval = Approval.new
    else
      redirect_to manuscripts_path, :flash => { :notice => 'Error! You do not have the correct administrative rights to issue an approval!' }
    end
  end

  def create
    @approval = Approval.new
    @manuscript = Manuscript.find(params[:manuscript_id])
    if @approval.save
      check_admin_type_and_save_approval
      check_approvals_and_generate_approval_number
    else
      redirect_to manuscripts_path, :flash => { :notice => 'There was an error!' }
    end
  end

  # Utility method to explicitly state params accepted by controller

    def approval_params
      params.require(:approval).permit(:approved, :comments)
    end

end
