class Staff::SessionsController < Staff::Base
  skip_before_action :authorize_check

  def new
    if current_staff
      redirect_to :users
    else
      @form = Staff::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Staff::LoginForm.new(login_params)
    staff = StaffMember.find_by(name: @form.name, password: @form.password)
    if staff.present?
      session[:current_staff_id] = staff.id
      redirect_to staff_users_path
    else
      flash.now.alert = 'nameまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:current_staff_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :staff_login
  end

  private
  def login_params
    params.require(:staff_login_form).permit(
      :name, :password
    )
  end

end
