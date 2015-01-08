class PagesController <ApplicationController

  def index
    @feeds = []
    @feeds << Feedjira::Feed.fetch_and_parse('http://www.theverge.com/rss/frontpage')
    @feeds << Feedjira::Feed.fetch_and_parse('http://www.engadget.com/rss.xml')


    @entries = []
    
    # for each feed in @feeds
    # for each entry in feed.entries
    # add to the @entries array (which you have to make above)
    # sort the @entries array
  end

  def new
  end

end
