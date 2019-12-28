class YoutubeInteractor
  KEY = 'AIzaSyBacEBBTjYylHDWHTtYpDEs2dZQFfW0hqo'
  BASE_URI = 'https://www.googleapis.com/youtube/v3/'.freeze

  def initialize(query = nil)
    @q = query.nil? ? 'Ruby on Rails' : query
  end

  def fields
    'snippet, statistics'
  end

  def get_videos
    _url = "#{BASE_URI}search?part=snippet&maxResults=5&type=video&key=#{KEY}&q=#{@q}"
    res = HTTParty.get(_url).body
    JSON.parse(res)
  end

  def get_details
    ids = get_videos["items"].collect{|video| video["id"]["videoId"]}
    _url = "#{BASE_URI}videos?part=#{fields}&key=#{KEY}&id=#{ids.join(',')}"
    res = HTTParty.get(_url).body
    JSON.parse(res)
  end
end
