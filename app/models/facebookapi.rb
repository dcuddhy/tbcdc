class Facebookapi

  def tbc
    encoded_url = URI.encode("https://graph.facebook.com/v2.2/TheBeardClub/posts/?limit=25&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
    uri = URI.parse(encoded_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @tbcdcx = JSON.parse(response.body)

    encoded_url = URI.encode("https://graph.facebook.com/v2.2/AmericanMustacheInstitute/posts/?limit=25&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
    uri = URI.parse(encoded_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @amix = JSON.parse(response.body)

    encoded_url = URI.encode("https://graph.facebook.com/v2.2/buildabeard/posts/?limit=25&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
    uri = URI.parse(encoded_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @babx = JSON.parse(response.body)

    encoded_url = URI.encode("https://graph.facebook.com/v2.2/GAFBO/posts/?limit=25&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
    uri = URI.parse(encoded_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @gafbox = JSON.parse(response.body)

    @smediax = []

    @tbcdcx['data'].each do |facebook|
      @smediax << facebook
    end

    @amix['data'].each do |facebook|
      @smediax << facebook
    end

    @gafbox['data'].each do |facebook|
      @smediax << facebook
    end

    @babx['data'].each do |facebook|
      @smediax << facebook
    end

    @smediax

  end

end
