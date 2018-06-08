class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to :users
    else
      @form = LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = LoginForm.new(login_params)
    user = User.find_by(name: @form.name, password: @form.password)
    if user.present?
      session[:current_user_id] = user.id
      redirect_to users_path
    else
      flash.now.alert = 'BOIS IDまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:current_user_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :login
  end

  private
  def login_params
    params.require(:login_form).permit(
      :name, :password
    )
  end

end
