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
    respond_to do |format|
  	if @user.update_with_password(user_params)
  		bypass_sign_in(@user)
      format.html { redirect_to @user, notice: 'Se cambio la contraseña de manera exitosa' }
      format.json { render :show, status: :created, location: @user }
  	else
  		render "edit"
  	end
  end
  end

  	private
  	def user_params
  		params.require(:user).permit(:password, :password_confirmation,:current_password)
  	end

end
