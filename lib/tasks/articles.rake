namespace :articles do

  desc 'fetches articles'
  task fetch: :environment do
    feeds = []
    feeds << Feedjira::Feed.fetch_and_parse('http://atlantamustache.com/feed/')
    feeds << Feedjira::Feed.fetch_and_parse('http://feeds.feedburner.com/WorldBeardAndMustacheChampionships')
    feeds << Feedjira::Feed.fetch_and_parse('http://feeds.feedburner.com/TheJacksonvilleBeardsmithSociety')
    feeds << Feedjira::Feed.fetch_and_parse('http://beardcoach.com/feed/')


    Article.delete_all
    feeds.each do |feed|
          puts feed.entries
      feed.entries.each do |entry|
        Article.create!(
          response: entry.to_h,
          published_at: entry.published,
          article_id: entry.url
        )
      end
    end

  end

end
