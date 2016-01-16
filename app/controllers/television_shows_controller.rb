class TelevisionShowsController < ApplicationController
  def create
    television_show = TelevisionShow.new(television_show_params)

    television_show.save

    redirect_to root_path
  end

  private

  def television_show_params
    params.require(:television_show).permit(:title)
  end
end
