class PagesController < ApplicationController
  def show
    @videos = get_full_details(params[:search])["items"]

    respond_to do |format|
      format.html
      format.json { render json: @videos }
    end
  end

  def get_full_details(q)
    yt = YoutubeInteractor.new(q)
    yt.get_details
  end
end
