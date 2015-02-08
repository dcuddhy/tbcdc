require 'rss'
require 'open-uri'
require "net/https"
require "uri"
require 'json'

require 'oauth'




class PagesController <ApplicationController

  def index

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

    @media = Kaminari.paginate_array(@smedia).page(params[:page]).per(40)

  end


  def wob

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

    @instagram['data'].each do |insta|
      @megagram << insta
    end

    @instagram2['data'].each do |insta|
      @megagram << insta
    end

    @instagram3['data'].each do |insta|
      @megagram << insta
    end

    @instagram4['data'].each do |insta|
      @megagram << insta
    end

    @wallobeard = Kaminari.paginate_array(@megagram).page(params[:page]).per(50)

  end


  def videos
    client = Tumblr::Client.new({
      :consumer_key => ENV['TUMBLR_CONSUMER_KEY'],
      :consumer_secret => ENV['TUMBLR_CONSUMER_SECRET'],
      :oauth_token => ENV['TUMBLR_OAUTH_TOKEN'],
      :oauth_token_secret => ENV['TUMBLR_OAUTH_TOKEN_SECRET']
    })

    @videos = client.dashboard( :limit => 100, :type => 'video', :reblog_info => true )



  @videos.values.each do |video|
    @foo = Kaminari.paginate_array(video).page(params[:page]).per(9)
  end




  end


  def facebook


    @entries = Article.order('published_at desc')

    @blogs = []
    @entries.each do |entry|
      @blogs << entry.response
    end

    # entries.flatten!
    # @entries = entries.sort_by{|entry| entry.published.utc}.reverse
  end


  private
    def smedia_params

      params.require(:smedia).permit(:page)

    end

end

#GOOGLE THIS SHIT
#permanence / temp ~ when to use bangs

#QUESTIONS:
#How do I look back at a commit to compare what I have/had?
