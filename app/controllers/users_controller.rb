class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @apps = @user.registered_applications
  end
  
end
