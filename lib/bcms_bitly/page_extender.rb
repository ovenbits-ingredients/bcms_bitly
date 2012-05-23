module BcmsBitly
  module PageExtender
    def self.included(model)
      model.after_create :bcms_bitly_create_short_link
      model.has_one :short_link, class_name: 'BcmsBitly::ShortLink'

      def bcms_bitly_create_short_link
        domain  = Rails.configuration.cms.site_domain
        sl      = build_short_link
        sl.url  = sl.shorten("http://#{domain}#{path}")
        sl.name = name
        sl.save
      end
    end
  end
end