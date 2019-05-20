require 'uri'
require 'net/http'

class VideoQuery
  def self.fetch(opts={})
    uri = URI.parse('https://api.zype.com/videos')
    uri.query = URI.encode_www_form(opts.merge(app_key: Rails.application.secrets.zype_app_key))
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
