class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers

  protect_from_forgery with: :exception

  def current_user
    super || Guest.new
  end

  private

  def signed_out?
    !signed_in?
  end
end
