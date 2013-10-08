class PropertiesController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @location = Location.new
  end

  def create
    @location = current_user.properties.create
    redirect_to @location
  end

  def show
    @location = Property.find_by_uuid(params[:id])
  end

  def new
    create
  end

end
