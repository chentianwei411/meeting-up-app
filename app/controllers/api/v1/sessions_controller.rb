class Api::V1::SessionsController < Api::V1::BaseController

  def create
    @user = User.find_by(email: create_params[:email])

    if @user && @user.valid_password?(create_params[:password])
      sign_in :user, @user
    else
      return api_error(status: 401)
    end
  end

  def api_error(opts={})
    # 可以只返回状态码，使用nothing: true
    # render nothing: true, status: opts[:status]
    render :json => {:message => 'login_in failed!'}, status: opts[:status]
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end

end
