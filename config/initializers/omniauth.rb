Rails.application.config.middleware.use OmniAuth::Builder do
  provider :bootic, ENV['BOOTIC_CLIENT_ID'], ENV['BOOTIC_CLIENT_SECRET'], scope: 'admin'
end
