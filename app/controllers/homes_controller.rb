class HomesController < ApplicationController
  def show
    if signed_out?
      render "pages/landing"
    else
      @recommended_items = RecommendedItem.
        where(user: current_user.with_following).
        newest_first

      render :show
    end
  end
end
