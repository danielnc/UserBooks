class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery

  def ensure_admin!
    redirect_to :root unless current_user.admin?
  end
end
