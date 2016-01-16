class HomesController < ApplicationController
  def show
    if signed_out?
      render "pages/landing"
    else
      render :show
    end
  end
end
