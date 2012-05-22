Rails.application.routes.draw do

  mount BcmsBitly::Engine => "/bcms_bitly"

  mount_browsercms
end
