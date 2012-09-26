module BcmsBitly
  module PageExtender
    def self.included(model)
      model.after_save :bcms_bitly_create_short_link
      model.has_one :short_link, class_name: 'BcmsBitly::ShortLink'

      def bcms_bitly_create_short_link
        if persisted?
          return unless path_changed?
        end

        domain  = Rails.configuration.cms.site_domain
        sl      = short_link || build_short_link
        sl.url  = sl.shorten("http://#{domain}#{path}")
        sl.name = name
        self.short_link = sl
        self.short_link.save!
        self.short_link.publish!
      end
    end
  end
end