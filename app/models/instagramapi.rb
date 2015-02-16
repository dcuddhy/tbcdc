  class Instagramapi

  def get_instagram_posts
    megagram = []
    counter = 0
    uri = URI.parse("https://api.instagram.com/v1/tags/tbcdc/media/recent?access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}&count=25")

    while counter < 4
      run = (http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request))
      instagram = JSON.parse(response.body)

      instagram['data'].each do |insta|
        megagram << insta
      end

      uri = URI.parse(instagram["pagination"]["next_url"])
      counter += 1
    end
    return megagram
  end

end
