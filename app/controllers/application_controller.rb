class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_mobile_preferences
  # Uncomment if you want a seperate mobile experience
  # before_filter :prepend_view_path_if_mobile

  private

  def set_mobile_preferences
    if params[:mobile_site]
      cookies.delete(:prefer_full_site)
      cookies.permanent[:prefer_mobile_site] = 1
    elsif params[:full_site]
      cookies.permanent[:prefer_full_site] = 1
      cookies.delete(:prefer_mobile_site)
    end
  end

  def prepend_view_path_if_mobile
    if mobile_request?      
      prepend_view_path Rails.root + 'app' + 'mobile_views'
    end
  end

  def mobile_request?
    cookies[:prefer_mobile_site] and not cookies[:prefer_full_site]
  end
  helper_method :mobile_request?


  def mobile_browser?
    # enable if you want to detect mobile user agent
    # request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(iPhone|iPod|iPad|Android)/]
  end
  helper_method :mobile_browser?

end