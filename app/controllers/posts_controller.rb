class PostsController < ApplicationController
  PER_PAGE = 12
  before_action :load_query, only: :infinite_scrolling

  def infinite_scrolling
    respond_to do |format|
      format.html
      format.js do
        @pagination = @query_result['pagination']
      end
    end
  end

  def show; end

  private

  def load_query
    @query_result = VideoQuery.fetch(page: params[:page], per_page: PER_PAGE)
    @posts = @query_result['response'].map { |e| VideoItem.new(e) }
  end
end
