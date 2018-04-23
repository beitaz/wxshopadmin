# == Schema Information
#
# Table name: skus
#
#  id                                   :bigint(8)        not null, primary key
#  price(商品价格(同种商品不同型号价格可能不同))          :integer          default(0)
#  sale_count(已售)                       :integer          default(0)
#  sku_name_ids(库存属性 ID("[1446,1447]")) :string(255)      default("")
#  sku_names(库存属性名称("[\"颜色\",\"尺码\"]")) :string(255)      default("")
#  sku_val_ids(库存属性值ID("[3562,3563]"))  :string(255)      default("")
#  sku_vals(库存属性值("[\"图片色\",\"S\"]"))   :string(255)      default("")
#  stock_num(库存)                        :integer          default(0)
#  stock_num_warn(库存警戒)                 :integer          default(0)
#  goods_id(商品)                         :bigint(8)
#  created_at                           :datetime         not null
#  updated_at                           :datetime         not null
#
# Indexes
#
#  index_skus_on_goods_id  (goods_id)
#

class Sku < ApplicationRecord
  has_and_belongs_to_many :goods
end
