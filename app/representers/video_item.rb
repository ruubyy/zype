class VideoItem
  HEIGHT_VARIANTS = [240, 480, 720, 1080]
  attr_accessor :json
  delegate :[], to: :json

  def initialize(json)
    @json = json
  end

  def thumbnail(size)
    raise ArgumentError, 'Not a valid size' unless HEIGHT_VARIANTS.include?(size)

    selected = json['thumbnails'].find { |e| e['height'] == size }
    selected ||= json['thumbnails'].first
    selected.try(:[], 'url') || 'missing.gif'
  end
end
