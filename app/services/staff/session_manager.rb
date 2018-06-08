module Staff::SessionManager
  def current_staff
    if session[:current_staff_id]
      @current_staff ||= StaffMember.find(session[:current_staff_id])
    end
  end

  # before action
  def authorize_check
    unless current_staff
      flash.alert = 'ログインしてください。'
      redirect_to :staff_login
    end
  end

end