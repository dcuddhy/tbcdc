require 'rss'
require 'open-uri'
require "net/https"
require "uri"
require 'json'

require 'oauth'




class PagesController <ApplicationController

  def index

  @sando = Facebookapi.new.tbc


  @sammy = Kaminari.paginate_array(Facebookapi.new.tbc).page(params[:page]).per(5)







    encoded_url = URI.encode("https://graph.facebook.com/v2.2/TheBeardClub/posts/?limit=25&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
    uri = URI.parse(encoded_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @tbcdc = JSON.parse(response.body)

    encoded_url = URI.encode("https://graph.facebook.com/v2.2/AmericanMustacheInstitute/posts/?limit=25&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
    uri = URI.parse(encoded_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @ami = JSON.parse(response.body)

    encoded_url = URI.encode("https://graph.facebook.com/v2.2/GAFBO/posts/?limit=25&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
    uri = URI.parse(encoded_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @gafbo = JSON.parse(response.body)

    encoded_url = URI.encode("https://graph.facebook.com/v2.2/buildabeard/posts/?limit=25&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
    uri = URI.parse(encoded_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @bab = JSON.parse(response.body)


    @smedia = []

    @tbcdc['data'].each do |facebook|
      @smedia << facebook
    end

    @ami['data'].each do |facebook|
      @smedia << facebook
    end

    @gafbo['data'].each do |facebook|
      @smedia << facebook
    end

    @bab['data'].each do |facebook|
      @smedia << facebook
    end





  @foo = Kaminari.paginate_array(@smedia).page(params[:page]).per(40)







  end




  def facebook

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
  end





def wob

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


  uri = URI.parse("https://api.instagram.com/v1/tags/mustache/media/recent?access_token=43415997.30a5aa1.d9970cb87c154a77bc5745c030754a80&count=25")
  run = (http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request))
  @instagram = JSON.parse(response.body)

  uri = URI.parse(@instagram["pagination"]["next_url"])
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  @instagram2 = JSON.parse(response.body)

  uri = URI.parse(@instagram2["pagination"]["next_url"])
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  @instagram3 = JSON.parse(response.body)

  uri = URI.parse(@instagram3["pagination"]["next_url"])
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  @instagram4 = JSON.parse(response.body)

  uri = URI.parse(@instagram4["pagination"]["next_url"])
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  @instagram5 = JSON.parse(response.body)

  uri = URI.parse(@instagram5["pagination"]["next_url"])
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  @instagram6 = JSON.parse(response.body)

  uri = URI.parse(@instagram6["pagination"]["next_url"])
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  @instagram7 = JSON.parse(response.body)

  uri = URI.parse(@instagram7["pagination"]["next_url"])
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  @instagram8 = JSON.parse(response.body)

  @megagram = []

  @megagram << @instagram
  @megagram << @instagram2
  @megagram << @instagram3
  @megagram << @instagram4

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

private
  def smedia_params

    params.require(:smedia).permit(:page)

  end



#GOOGLE THIS SHIT
#permanence / temp ~ when to use bangs

#QUESTIONS:
#How do I look back at a commit to compare what I have/had?
