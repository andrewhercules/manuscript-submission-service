class ApprovalsController < ApplicationController

  load_and_authorize_resource param_method: :approval_params

  def new
    @manuscript = Manuscript.find(params[:manuscript_id])
    @approval = Approval.new
  end

  def create
    @manuscript = Manuscript.find(params[:manuscript_id])
    @manuscript.approvals.create(approval_params)
    redirect_to manuscripts_path
  end

  # Utility method to explicitly state params accepted by controller

    def approval_params
      params.require(:approval).permit(:approved, :comments)
    end

end
