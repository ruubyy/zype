require 'test_helper'
 
class ArticleTest < ActiveSupport::TestCase
  test 'should return JSON' do
    videos = VideoQuery.fetch(page: 1)
    assert(videos.class.name, 'JSON')
  end

  test 'should return pagination info' do
    videos = VideoQuery.fetch(page: 1)
    assert(videos['pagination']['next'], 2)
  end
end
