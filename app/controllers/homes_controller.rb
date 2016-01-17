class HomesController < ApplicationController
  def show
    if signed_out?
      render "pages/landing"
    else
      @recommended_items = RecommendedItem.all
      render :show
    end
  end
end
