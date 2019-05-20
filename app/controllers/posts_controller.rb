class PostsController < ApplicationController

  def infinite_scrolling
    @posts = VideoQuery.fetch(page: params[:page], per_page: 12)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  end
end
