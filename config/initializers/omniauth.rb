# Initilizers hold configuration settings that should be made after 
# all of the frameworks and plugins are loaded

# Configure Oauth providers 
Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  # Provier = authenticating 3rd parties
  # GitHub strategy
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end