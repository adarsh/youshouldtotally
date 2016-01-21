class TelevisionShowsController < ApplicationController
  def create
    television_show = TelevisionShow.find_or_create_by(television_show_params)

    unless current_user.recommend(television_show)
      flash[:error] = t(".cannot_recommend_twice")
    end

    redirect_to root_path
  end

  private

  def television_show_params
    params.require(:television_show).permit(:title)
  end
end
