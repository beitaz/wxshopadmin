class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :status,            null: false,  default: 0,    comment: '订单状态: 1-未付款,2-待收货,3-已完成'
      t.integer :receive,           null: false,  default: 0,    comment: '签收状态: 1-待付款,2-待发货,3-待收货'
      t.integer :category,          null: false,  default: 0,    comment: '订单类型'
      t.belongs_to :visitor,                                     comment: '用户'

      t.timestamps
    end

    add_index :orders, :category
  end
end
