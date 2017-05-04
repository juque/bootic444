class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    session[:access_token].present?
  end

  def bootic_client
    @bootic_client ||= BooticClient.client(:authorized, access_token: session[:access_token]) do |new_token|
      Rails.logger.info "Renewed access token"
      session[:access_token] = new_token
    end
  end

  helper_method :current_shop

  protected 

  def login_required
    redirect_to root_url and return unless logged_in?
  end

  def bootic_root
    @bootic_root ||= bootic_client.root
  end

  def current_shop
    @current_shop ||= bootic_root.shops.first
  end

end
