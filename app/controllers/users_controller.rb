class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:show]
  def Index
  end

  def show
  	@user=User.find_by_id(params[:id])
  end

  def edit
  	@user= current_user
  end

  def update_password
  	@user=current_user
  	if @user.update_with_password(user_params)
  		bypass_sign_in(@user)
  		redirect_to root_path
  	else
  		render "edit"
  	end
  end

  	private
  	def user_params
  		params.require(:user).permit(:password, :password_confirmation,:current_password)
  	end

end
