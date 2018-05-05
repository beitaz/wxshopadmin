# == Schema Information
#
# Table name: photos
#
#  id              :bigint(8)        not null, primary key
#  photo(图片)       :string(255)
#  thum_photo(缩略图) :string(255)
#  good_id         :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_photos_on_good_id  (good_id)
#

class Photo < ApplicationRecord
  belongs_to :good
  # attr_accessor :delete_photo, :delete_thum_photo
  # has_attached_file :photo, styles: { medium: '300x300>' }, default_url: '/images/:style/missing.png'
  # has_attached_file :thum_photo, styles: { thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  # validates_attachment_content_type [:photo, :thum_photo], content_type: /\Aimage\/.*\z/
  # validates_with AttachmentPresenceValidator, attributes: [:photo, :thum_photo]
  # validates_with AttachmentSizeValidator, attributes: [:photo, :thum_photo], less_than: 1.megabytes
  # before_validation :clear_images

  # def clear_images
  #   photo.clear if delete_photo == '1'
  #   thum_photo.clear if delete_thum_photo == '1'
  # end
end
