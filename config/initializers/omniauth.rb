Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  # provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :tumblr, ENV['TUMBLR_KEY'], ENV['TUMBLR_SECRET']
  # provider :instagram, ENV['INSTAGRAM_KEY'], ENV['INSTAGRAM_SECRET']
  # provider :flickr, ENV['FLICKR_KEY'], ENV['FLICKR_SECRET']
  # provider :500px, ENV['500PX_KEY'], ENV['500PX_SECRET']
end
