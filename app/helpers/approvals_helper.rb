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

  def check_approvals_and_generate_approval_number
    if @manuscript.vpr_approval == true && @manuscript.kti_approval == true
      time = Time.now
      formatted_time = time.strftime("%d%m%Y")
      random_code =  approval_number_generator(5)
      new_approval_number = formatted_time + "_" + random_code
      @manuscript.update(approval_number: new_approval_number)
    else
      return "N/A"
    end
  end

  def approval_number_generator(number)
  charset = Array(1..10) + Array('a'..'d')
  Array.new(number) { charset.sample }.join
end

end
