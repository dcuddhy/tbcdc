class PagesController <ApplicationController

  def index
    @feeds = []
    # @feeds << Feedjira::Feed.fetch_and_parse('http://www.engadget.com/rss.xml')
    @feeds << Feedjira::Feed.fetch_and_parse('http://atlantamustache.com/feed/')
    @feeds << Feedjira::Feed.fetch_and_parse('http://www.theverge.com/rss/frontpage')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://feeds.feedburner.com/WorldBeardAndMustacheChampionships')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://beardcoach.com/feed/')
    # @feeds << Feedjira::Feed.fetch_and_parse('https://www.kickstarter.com/projects/755494424/beardo-the-movie-a-documentary/posts.atom')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://facialhairhandbook.com/rss')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://feeds.feedburner.com/TheJacksonvilleBeardsmithSociety')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://mustachesforkids.org/feed/')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://m4kottawa.org/feed/')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://www.m4kvancouver.org/feed/')
    # @feeds << Feedjira::Feed.fetch_and_parse('http://www.build-a-beard.com/bab/rss.xml')

    entries = []
    @feeds.each do |feed|
      entries << feed.entries
    end

    entries.flatten!
    @entries = entries.sort_by{|entry| entry.published.utc}.reverse
  end

  #GOOGLE THIS SHIT
  #permanence / temp ~ when to use bangs

    #For Andrew:
    #Why does Engadget break my titlecase?
    #How can I limit image width in my feeds - see Engadget?
    #Why does build-a-beard break entry in this controller ln:17?
    #How do I look back at a commit to compare what I have/had?


  def new
  end

end
