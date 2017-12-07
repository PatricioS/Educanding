class UsersController < ApplicationController
  def Index
  end

  def show
  	@user=User.find_by_id(params[:id])
  end
end
