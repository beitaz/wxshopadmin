# == Schema Information
#
# Table name: skus
#
#  id                          :bigint(8)        not null, primary key
#  name(库存属性)                  :string(255)
#  defaulted                   :boolean          default(FALSE)
#  price(商品价格(同种商品不同型号价格可能不同)) :integer          default(0)
#  sale_count(已售)              :integer          default(0)
#  stock_num(库存)               :integer          default(0)
#  stock_num_warn(库存警戒)        :integer          default(0)
#  good_id(商品)                 :bigint(8)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
# Indexes
#
#  index_skus_on_good_id  (good_id)
#  index_skus_on_name     (name)
#

class Sku < ApplicationRecord
  has_many :resources, as: :classable
  belongs_to :good, optional: true
end
