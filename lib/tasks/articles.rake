namespace :articles do

  desc 'fetches articles'
  task fetch: :environment do
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

    encoded_url = URI.encode("https://graph.facebook.com/v2.2/buildabeard/posts/?limit=25&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
    uri = URI.parse(encoded_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @bab = JSON.parse(response.body)

    encoded_url = URI.encode("https://graph.facebook.com/v2.2/GAFBO/posts/?limit=25&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
    uri = URI.parse(encoded_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @gafbo = JSON.parse(response.body)

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

    Article.delete_all
    @smedia.each do |facebook|
          puts facebook
        Article.create!(
          response: entry.to_h,
          published_at: entry.published,
          article_id: entry.url
        )
    end

  end

end
