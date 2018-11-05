class UsersController < ApplicationController
  before_action :require_user, only: [:index]
  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :email,
                                 :password, :password_confirmation)
  end
end
