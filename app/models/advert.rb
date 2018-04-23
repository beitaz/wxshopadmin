# == Schema Information
#
# Table name: adverts
#
#  id                  :bigint(8)        not null, primary key
#  title(广告标题)         :string(255)      default("")
#  pic_url(广告图片)       :string(255)      default("")
#  advert_url(广告地址)    :string(255)      default("")
#  promo_pic_url(推广图片) :string(255)      default("")
#  promo_tips(推广提示)    :string(255)      default("")
#  promo_desc(推广描述)    :string(255)      default("")
#  type(广告类型)          :integer          default(0)
#  sort(显示顺序)          :integer          default(0)
#  status(状态)          :integer          default(0)
#  present_amout       :integer          default(0)
#  limit_fowards       :integer          default(0)
#  limit_price         :integer          default(0)
#  location_flag       :integer          default(0)
#  isdeleted(标记删除)     :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Advert < ApplicationRecord
  has_one :good, dependent: :destroy
end
