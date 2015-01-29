require 'rss'
require 'open-uri'
require "net/https"
require "uri"
require 'json'



class PagesController <ApplicationController

  def index

    # @feeds = []
    # @feeds << Feedjira::Feed.fetch_and_parse('https://www.facebook.com/feeds/page.php?format=rss20&id=218130979387')

    # @feeds << Feedjira::Feed.fetch_and_parse('http://atlantamustache.com/feed/')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://feeds.feedburner.com/WorldBeardAndMustacheChampionships')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://beardcoach.com/feed/')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://feeds.feedburner.com/TheJacksonvilleBeardsmithSociety')
    #
    # entries = []
    # @feeds.each do |feed|
    #   entries << feed.entries
    # end




    @entries = Article.order('published_at desc')

    @blogs = []
    @entries.each do |entry|
      @blogs << entry.response
    end

    # entries.flatten!
    # @entries = entries.sort_by{|entry| entry.published.utc}.reverse


#schedule rake tasks - heroku scheduler


# Dead??
    # @feeds << Feedjira::Feed.fetch_and_parse('https://www.kickstarter.com/projects/755494424/beardo-the-movie-a-documentary/posts.atom')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://mustachesforkids.org/feed/ ')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://www.m4kvancouver.org/feed/')


#breaks site
    # @bab = []
    # @bab << Feedjira::Feed.fetch_and_parse('http://www.build-a-beard.com/bab/rss.xml')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://facialhairhandbook.com/rss')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://m4kottawa.org/feed/') ## NILS atlanta mustache
    #
    def facebook
      @facebook = []
      @facebook << Feedjira::Feed.fetch_and_parse('http://www.facebook.com/feeds/page.php?format=rss20&id=218130979387')
    end


  end


def wob
  # @wob =[]
  # @wob << Feedjira::Feed.fetch_and_parse('https://api.instagram.com/v1/media/popular?client_id=30a5aa19e0a2474b902dfe674681c669')


  @flickr = []
  @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=beard&lang=en-us&format=rss_200')
  @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=mustache&lang=en-us&format=rss_200')
  @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=moustache&lang=en-us&format=rss_200')
  @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=goatee&lang=en-us&format=rss_200')
  @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=facialhair&lang=en-us&format=rss_200')
  @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=soulpatch&lang=en-us&format=rss_200')
  @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=sideburns&lang=en-us&format=rss_200')
  @flickr << Feedjira::Feed.fetch_and_parse('http://widget.websta.me/rss/tag/beard')
  @flickr << Feedjira::Feed.fetch_and_parse('http://widget.websta.me/rss/tag/mustache')
  @flickr << Feedjira::Feed.fetch_and_parse('http://widget.websta.me/rss/tag/facialhair')
  @flickr << Feedjira::Feed.fetch_and_parse('http://widget.websta.me/rss/tag/soulpatch')
  @flickr << Feedjira::Feed.fetch_and_parse('http://widget.websta.me/rss/tag/sideburns')





uri = URI.parse("https://api.instagram.com/v1/tags/beard/media/recent?access_token=43415997.30a5aa1.d9970cb87c154a77bc5745c030754a80")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)

@instagram = JSON.parse(response.body)




    client = Instagram::Client.new({
      :client_id => ENV['INSTAGRAM_CLIENT_ID'],
      :client_secret => ENV['INSTAGRAM_CLIENT_SECRET'],
      :access_token => ENV['INSTAGRAM_ACCESS_TOKEN'],
    })

# KENDRA NOISE
#     url = 'https://api.instagram.com/v1/tags/beard/media/recent?access_token=43415997.30a5aa1.d9970cb87c154a77bc5745c030754a80'
#     open(url) do |rss|
#       @foo = RSS::Parser.parse(rss)
#     end


  # @flickr.flatten!
  # entries = []
  # @flickr.each do |feed|
  #   entries << feed.entries
  # end

end


  def facebook
    @facebook = []
    @facebook << Feedjira::Feed.fetch_and_parse('http://www.facebook.com/feeds/page.php?format=rss20&id=218130979387')
  end

  # entries = []
  # @feeds.each do |feed|
  #   entries << feed.entries
  # end

  def new
  end

  def videos
    client = Tumblr::Client.new({
      :consumer_key => ENV['TUMBLR_CONSUMER_KEY'],
      :consumer_secret => ENV['TUMBLR_CONSUMER_SECRET'],
      :oauth_token => ENV['TUMBLR_OAUTH_TOKEN'],
      :oauth_token_secret => ENV['TUMBLR_OAUTH_TOKEN_SECRET']
    })

    @videos = client.dashboard( :limit => 100, :type => 'video', :reblog_info => true )


    @tumblr = []
      @videos.each do |tvideo|
        @tumblr <<tvideo.entries
    end


  end

end





#GOOGLE THIS SHIT
#permanence / temp ~ when to use bangs

#QUESTIONS:
#Why does Engadget break my titlecase?
#How do I look back at a commit to compare what I have/had?
