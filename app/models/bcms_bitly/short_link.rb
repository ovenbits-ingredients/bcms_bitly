require 'bitly'

module BcmsBitly
  class ShortLink < ActiveRecord::Base
    acts_as_content_block
    belongs_to :page, class_name: 'Cms::Page'
    validates_presence_of :url

    # Turn a URL into a shorter Bitly URL
    #
    # url - A String URL
    #
    # Examples
    #
    #   shorten('http://www.google.com')
    #
    # Returns the shortened URL String
    def shorten(url)
      Bitly.use_api_version_3
      username = BcmsBitly::Engine.config.bitly_username
      api_key  = BcmsBitly::Engine.config.bitly_api_key
      bitly    = Bitly.new(username, api_key)
      bitly.shorten(url).short_url
    end
  end
end
