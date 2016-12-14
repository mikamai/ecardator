class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # http_basic_authenticate_with name: "ecardator", password: "venereve24"


  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
	I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
  	{ locale: I18n.locale }
  end

end
