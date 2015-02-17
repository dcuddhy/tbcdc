require 'open-uri'
require "net/https"
require 'json'

class PagesController <ApplicationController

  def index
    @media = Kaminari.paginate_array(Facebookapi.new.tbc.sort_by{|fbook| fbook['created_time']}.reverse).page(params[:page]).per(60)
  end

  def wob
    @megagram = Instagramapi.new.get_instagram_posts
    @wallobeard = Kaminari.paginate_array(@megagram).page(params[:page]).per(50)
  end

  def videos
    @videos = Tumblrapi.new.get_tumblr_posts
    @videos.values.each do |video|
      @foo = Kaminari.paginate_array(video).page(params[:page]).per(9)
    end
  end

end
