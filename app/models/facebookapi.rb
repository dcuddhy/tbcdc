class Facebookapi

  def tbc
    tbcdc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/TheBeardClub/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @tbcdc = JSON.parse(response.body)
    end

    ami_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/AmericanMustacheInstitute/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @ami = JSON.parse(response.body)
    end

    bab_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/buildabeard/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @bab = JSON.parse(response.body)
    end

    gafbo_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/GAFBO/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @gafbo = JSON.parse(response.body)
    end

    phpabc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/philadelphiabeardclub/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @phpabc = JSON.parse(response.body)
    end

    twhinas_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/TheWhiskerinas/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @twhinas = JSON.parse(response.body)
    end

    alamobc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/alamobeard.club.1/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @alamobc = JSON.parse(response.body)
    end

    tbbc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/thebritishbeardclub/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @tbbc = JSON.parse(response.body)
    end

    rmbmc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/RMBMC/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @rmbmc = JSON.parse(response.body)
    end

    tenbmc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/BEARDSareCOOL/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @tenbmc = JSON.parse(response.body)
    end

    okcbc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/OKCBeardClub/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @okcbc = JSON.parse(response.body)
    end

    azbc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/CanyonStateBC/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @azbc = JSON.parse(response.body)
    end

    readingbmc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/ReadingBMC/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @readingbmc = JSON.parse(response.body)
    end

    pittsbmc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/SteelCityBeards/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @pittsbmc = JSON.parse(response.body)
    end

    jerseybmc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/jerseybmc/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @jerseybmc = JSON.parse(response.body)
    end

    scakbmc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/SCAKBMC/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @scakbmc = JSON.parse(response.body)
    end

    glasbmc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/GlasgowBeardAndMoustacheClub/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @glasbmc = JSON.parse(response.body)
    end

    gabmc_thread = Thread.new do
      encoded_url = URI.encode("https://graph.facebook.com/v2.2/BeardedSinnersGa/posts/?limit=20&oauth_token=#{ENV['FACEBOOK_OAUTH_TOKEN']}")
      uri = URI.parse(encoded_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @gabmc = JSON.parse(response.body)
    end

    tbcdc_thread.join
    bab_thread.join
    gafbo_thread.join
    ami_thread.join
    phpabc_thread.join

    twhinas_thread.join
    alamobc_thread.join
    tbbc_thread.join
    rmbmc_thread.join
    tenbmc_thread.join
    okcbc_thread.join
    azbc_thread.join
    readingbmc_thread.join
    pittsbmc_thread.join
    jerseybmc_thread.join
    scakbmc_thread.join
    glasbmc_thread.join
    gabmc_thread.join

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

    @phpabc['data'].each do |facebook|
      @smedia << facebook
    end

    @twhinas['data'].each do |facebook|
      @smedia << facebook
    end

    @alamobc['data'].each do |facebook|
      @smedia << facebook
    end

    @tbbc['data'].each do |facebook|
      @smedia << facebook
    end

    @rmbmc['data'].each do |facebook|
      @smedia << facebook
    end

    @tenbmc['data'].each do |facebook|
      @smedia << facebook
    end

    @okcbc['data'].each do |facebook|
      @smedia << facebook
    end

    @azbc['data'].each do |facebook|
      @smedia << facebook
    end

    @readingbmc['data'].each do |facebook|
      @smedia << facebook
    end

    @pittsbmc['data'].each do |facebook|
      @smedia << facebook
    end

    @jerseybmc['data'].each do |facebook|
      @smedia << facebook
    end

    @scakbmc['data'].each do |facebook|
      @smedia << facebook
    end

    @glasbmc['data'].each do |facebook|
      @smedia << facebook
    end

    @gabmc['data'].each do |facebook|
      @smedia << facebook
    end

    @smedia

  end

end
