# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  require 'redcloth'
  include AuthenticatedSystem
  include CacheableFlash
  
  before_filter  :restrict
  before_filter  :find_site
  helper_method  :site
  attr_reader    :site
  
  def restrict
    front = params[:controller] == 'pages' && params[:action] == 'show' && !params[:id]
    users = params[:controller] == 'users'
    sessions = params[:controller] == 'sessions'
    auth = current_user.login == 'kyle' || current_user.login == 'winton' if logged_in?
    go = front || users || sessions || (logged_in? && auth)
    redirect_to('/') unless go
  end
  
  def find_site
    @site ||= Site.find(:first)
  end
  
  def require_admin
    redirect_to(page_path('home')) unless admin?
  end
  
end
