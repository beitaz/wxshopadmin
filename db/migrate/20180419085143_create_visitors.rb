class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.string :uid,                                default: ''
      t.string :email,                              default: ''
      t.string :nick_name,                          default: ''
      t.string :mobile,                             default: ''
      t.integer :gender,                            default: 0,   comment: '0:未知, 1:男, 2:女'
      t.string :city,                               default: ''
      t.string :province,                           default: ''
      t.string :country,                            default: ''
      t.string :avatar_url,                         default: ''
      t.string :openid,              null: false,   default: ''
      t.string :token,               null: false,   default: ''

      t.timestamps
    end

    add_index :visitors, :uid,     unique: true
    add_index :visitors, :openid,  unique: true
    add_index :visitors, :token,   unique: true

    # create_table :goods_visitors do |t|
    #   t.belongs_to :visitor,       index: true
    #   t.belongs_to :good,          index: true
    #   t.integer :category,                        default: 0,   comment: '0-无,1-已浏览,2-已收藏'
    # end
    
    # # execute "ALTER TABLE `goods_visitors` ADD UNIQUE `unique_visitor_good`(`visitor_id`, `good_id`);"
    # add_index :goods_visitors, [:visitor_id, :good_id], unique: true
    # add_index :goods_visitors, :category
  end
end
