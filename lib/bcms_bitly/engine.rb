require 'browsercms'
module BcmsBitly
  class Engine < ::Rails::Engine
    isolate_namespace BcmsBitly
		include Cms::Module

    config.to_prepare do
      Cms::Page.send :include, BcmsBitly::PageExtender
    end
  end
end
