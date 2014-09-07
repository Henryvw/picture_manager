class Picture < ActiveRecord::Base
belongs_to :monument

has_attached_file :photo,
  :styles => {
    :large => "450x450>",
    :medium => "375x375>",
    :thumb => "100x100>"
    },
  :default_url => "/images/:style/missing.png"


validates_attachment_content_type :photo, content_type: ['image/jpeg', 'image/png']

end
