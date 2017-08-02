BooticClient.configure do |c|
  c.client_id = ENV['BOOTIC_CLIENT_ID']
  c.client_secret = ENV['BOOTIC_CLIENT_SECRET']
  c.logger = Rails.logger
  c.logging = Rails.env.development?
  c.cache_store = Rails.cache
end
