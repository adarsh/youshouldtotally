class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers

  protect_from_forgery with: :exception

  private

  def signed_out?
    !signed_in?
  end
end
