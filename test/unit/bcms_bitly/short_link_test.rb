require 'test_helper'

module BcmsBitly
  class ShortLinkTest < ActiveSupport::TestCase
    test 'shorten returns a short URL from bitly' do
      ShortLink.new.shorten 'http://google.com'
    end

    test 'a created page causes a ShortLink to be created' do
      assert_difference ['Cms::Page.count', 'BcmsBitly::ShortLink.count'] do
        @page = Cms::Page.create name: 'Test', path: '/test'
      end

      assert_present @page.short_link
      assert_equal @page.name, @page.short_link.name
    end

    test 'an existing page updates its ShortLink when the path is changed' do
      page = Cms::Page.create name: 'Test', path: '/test'
      old_url = page.short_link.url
      page.update_attribute :path, '/test2'
      page.publish!
      page.reload

      assert page.short_link.url != old_url
    end

    test 'ShortLink is not updated when page is saved but path is unchanged' do
      page = Cms::Page.create name: 'Test', path: '/test'
      old_url = page.short_link.url
      page.update_attribute :name, 'Test2'
      page.publish!
      page.reload

      assert_equal page.short_link.url, old_url
    end
  end
end
