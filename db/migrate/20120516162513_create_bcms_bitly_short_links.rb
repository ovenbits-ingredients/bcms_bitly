class CreateBcmsBitlyShortLinks < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "BcmsBitly::ShortLink", :group_name => "BcmsBitly")
    create_content_table :bcms_bitly_short_links, :prefix=>false do |t|
      t.string :url
      t.integer :page_id

      t.timestamps
    end
  end
end
