class PagesController <ApplicationController

  def index

    @feeds = []
    @feeds << Feedjira::Feed.fetch_and_parse('https://www.facebook.com/feeds/page.php?format=rss20&id=218130979387')

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

    #
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



  end


def wob
  @wob =[]
  @wob << Feedjira::Feed.fetch_and_parse('https://api.instagram.com/v1/media/popular?client_id=30a5aa19e0a2474b902dfe674681c669')


  @flickr = []
  @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=beard&lang=en-us&format=rss_200')
  # @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=mustache&lang=en-us&format=rss_200')
  # @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=moustache&lang=en-us&format=rss_200')
  # @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=goatee&lang=en-us&format=rss_200')
  # @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=facialhair&lang=en-us&format=rss_200')
  # @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=soulpatch&lang=en-us&format=rss_200')
  # @flickr << Feedjira::Feed.fetch_and_parse('http://api.flickr.com/services/feeds/photos_public.gne?tags=sideburns&lang=en-us&format=rss_200')
end

  # entries = []
  # @flickr.each do |feed|
  #   entries << feed.entries
  # end



  #GOOGLE THIS SHIT
  #permanence / temp ~ when to use bangs

    #QUESTIONS:
    #Why does Engadget break my titlecase?
    #How do I look back at a commit to compare what I have/had?
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

end
