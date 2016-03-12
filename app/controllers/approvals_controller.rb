class ApprovalsController < ApplicationController

  def new
    @manuscript = Manuscript.find(params[:manuscript_id])
    @approval = Approval.new
  end

  def create
    @approval = Approval.new
    @manuscript = Manuscript.find(params[:manuscript_id])
    if @approval.save
      @manuscript.approvals.create(approval_params)
      @manuscript.update(vpr_approval: true)
      redirect_to manuscripts_path
    else
      flash[:notice] = "Error! Something went wrong!"
      redirect_to manuscripts_path
    end
  end

  # Utility method to explicitly state params accepted by controller

    def approval_params
      params.require(:approval).permit(:approved, :comments)
    end

end
