class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :not_home

  private

  def not_home
    @home = false
  end
end
