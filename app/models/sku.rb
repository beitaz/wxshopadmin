# == Schema Information
#
# Table name: skus
#
#  id                          :bigint(8)        not null, primary key
#  parent_id(自连接)              :bigint(8)
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
#  index_skus_on_good_id             (good_id)
#  index_skus_on_parent_id           (parent_id)
#  index_skus_on_parent_id_and_name  (parent_id,name) UNIQUE
#

class Sku < ApplicationRecord
  has_many :skus, class_name: 'Sku', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Sku', optional: true
  has_and_belongs_to_many :goods

  validates :name, presence: true, uniqueness: { scope: :parent_id}

  scope :base, -> { where(parent_id: 0) }
end
