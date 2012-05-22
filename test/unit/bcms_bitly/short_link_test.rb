require 'test_helper'

module BcmsBitly
  class ShortLinkTest < ActiveSupport::TestCase
    test "shorten returns a short URL from bitly" do
      ShortLink.new.shorten('http://google.com')
    end

    test "a created page causes a ShortLink to be created" do
      assert_difference ['Cms::Page.count', 'BcmsBitly::ShortLink.count'] do
        @page = Cms::Page.create(name: 'Test', path: 'test')
      end

      assert_present @page.short_link
      assert_equal @page.name, @page.short_link.name
    end
  end
end
