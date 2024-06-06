class Admin::SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: session_params[:name])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to admin_items_url, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to admin_login_path, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
