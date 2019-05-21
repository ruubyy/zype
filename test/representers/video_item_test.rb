require 'test_helper'
 
class ArticleTest < ActiveSupport::TestCase
  test 'should return thumbnail with height 240' do
    json = YAML::load_file(Rails.root.join('test', 'files', 'videos.yml'))['with_thumbnail']
    item = VideoItem.new(json)
    assert(item.thumbnail(240), 'https://i.ytimg.com/vi/jhz862KOstA/mqdefault.jpg')
  end

  test 'should return first thumbnail url' do
    json = YAML::load_file(Rails.root.join('test', 'files', 'videos.yml'))['with_invalid_thumbnail']
    item = VideoItem.new(json)
    assert(item.thumbnail(240), 'https://i.ytimg.com/vi/jhz862KOstA/default.jpg')
  end

  test 'should return missing.png when no thumbnail' do
    json = YAML::load_file(Rails.root.join('test', 'files', 'videos.yml'))['without_thumbnail']
    item = VideoItem.new(json)
    assert(item.thumbnail(240), 'missing.png')
  end
end
