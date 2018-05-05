# == Schema Information
#
# Table name: orders
#
#  id                               :bigint(8)        not null, primary key
#  status(订单状态: 1-未付款,2-待收货,3-已完成)  :integer          default(0), not null
#  receive(签收状态: 1-待付款,2-待发货,3-待收货) :integer          default(0), not null
#  category(订单类型)                   :integer          default(0), not null
#  visitor_id(用户)                   :bigint(8)
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#
# Indexes
#
#  index_orders_on_category    (category)
#  index_orders_on_visitor_id  (visitor_id)
#

class Order < ApplicationRecord
  belongs_to :visitor
end
