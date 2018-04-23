# == Schema Information
#
# Table name: businesses
#
#  id               :bigint(8)        not null, primary key
#  name(公司名称)       :string(255)      default("")
#  brand_name(品牌名称) :string(255)      default("")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Business < ApplicationRecord
  has_many :goods, foreign_key: 'business_id'
end
