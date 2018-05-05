# == Schema Information
#
# Table name: discovers
#
#  id                    :bigint(8)        not null, primary key
#  code(编码)              :string(255)
#  logo(图标)              :string(255)
#  brand(品牌)             :string(255)
#  brand_category(品牌类型)  :string(255)
#  season(年份季节)          :string(255)
#  season_category(季节类型) :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Discover < ApplicationRecord
end
