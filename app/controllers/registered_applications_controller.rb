class RegisteredApplicationsController < ApplicationController
  
  def show
    @app = RegisteredApplication.find(params[:id])
    @user = User.find(@app.user_id)
    puts @events = @app.events.group_by(&:name)
  end

  def create
    
    @user = User.find(params[:user_id])
    @app = @user.registered_applications.new(app_params)
    
    if @app.save
      flash[:notice] = "App added to list."
    else
      parse_errors(@app.errors)
    end
    
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
  end

  def destroy
    @app = RegisteredApplication.find(params[:id])
    @user = User.find(@app.user_id)
    
    if @app.delete
      flash[:notice] = "Application successfully removed."
    else
      flash[:alert] = "An error has occured. Please try again."
    end
    redirect_to user_path(@user)
  end
  
  private
  
  def app_params
    params.require(:registered_application).permit(:title, :url, :user_id)
  end
  
  def parse_errors(errors)
    flash[:alert] = []
    errors.messages.map { |k,v|
      flash[:alert] << "#{k} submitted #{v.first}"
    }
    flash[:alert]
  end
  
end
