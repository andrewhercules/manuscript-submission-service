module ApprovalsHelper

  def check_admin_type_and_save_approval
    if current_user.vpr_admin?
      @manuscript.approvals.create(approval_params)
      @manuscript.update(vpr_approval: true)
      redirect_to manuscripts_path
    elsif current_user.kti_admin?
      @manuscript.approvals.create(approval_params)
      @manuscript.update(kti_approval: true)
      redirect_to manuscripts_path
    else
      flash[:notice] = "Error!"
      redirect_to manuscripts_path
    end
  end

end
