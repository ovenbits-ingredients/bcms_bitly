BcmsBitly::Engine.routes.draw do
  mount BcmsBitly::Engine => '/bcms_bitly'

  content_blocks :short_links

end
