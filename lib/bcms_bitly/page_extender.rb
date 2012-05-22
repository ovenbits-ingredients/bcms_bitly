module BcmsBitly
  module PageExtender
    def self.included(model)
      model.after_create :bcms_bitly_create_short_link
      model.has_one :short_link, class_name: 'BcmsBitly::ShortLink'

      def bcms_bitly_create_short_link
        sl      = BcmsBitly::ShortLink.new(page_id: id)
        sl.url  = sl.shorten('http://' + SITE_DOMAIN + path)
        sl.name = name
        sl.save
      end
    end
  end
end