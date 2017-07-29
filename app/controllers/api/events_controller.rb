class API::EventsController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  # Skip devise login credentials
  skip_before_action :authenticate_user!
  
  before_filter :set_access_control_headers
  
  # Set CORS ( Cross Origin Resource Scripting ) to allow for bypassing Rails CSRF check
  def set_access_control_headers
    # '*' Allows for a request from ANY origin
    headers['Access-Control-Allow-Origin'] = '*'
    # permit the following request methods
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    # Allowed to declare type of data being sent through
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end
    
  
  def create
    
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    
    if registered_application.nil?
      render json: "Unregistered application", status: :unprocessable_entity
    else
      @event = registered_application.events.create(event_params)
      if @event.save
        render json: @event, status: :created
      else
        render json: { errors: @event.errors }, status: :unprocessed_entity
      end
    end
    
  end
  
  def preflight
    head 200
  end
  
  private
  
  def event_params
    params.require(:event).permit(:name)
  end
  
end
