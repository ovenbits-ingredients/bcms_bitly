module BcmsBitly
  class Engine < ::Rails::Engine
    config.bitly_username = 'username'
    config.bitly_api_key  = 'api_key'
  end
end