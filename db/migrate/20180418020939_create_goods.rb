class CreateGoods < ActiveRecord::Migration[5.1]
  def change
    # 商品
    create_table :goods do |t|
      t.string :uid, comment: '商品条码'
      t.string :name, comment: '商品名称'
      t.string :title, comment: '广告标题'
      t.string :code, comment: '产品编码'
      t.string :brand_name, comment: '品牌名称'
      t.string :logo, comment: '图标'
      t.string :thum_logo, comment: '缩略图'
      t.integer :stock_num, default: 0, comment: '库存'
      t.integer :price, default: 0, comment: '(进货)价格'
      t.integer :market_price, default: 0, comment: '商城价'
      t.integer :whole_price, default: 0, comment: '分享价'
      t.integer :whole_num, default: 0, comment: '(享受分享价条件)分享次数'
      t.string :share_tips, comment: '分享提示'
      t.integer :share_times, default: 0, comment: '分享次数'
      t.integer :share_amount, default: 0, comment: '总分享次数'
      t.integer :min_buy_num, default: 0, comment: '最少购买数量'
      t.integer :free_ship_num, default: 0, comment: '免运费数量'
      t.integer :freight, default: 0, comment: '单件运费'
      t.integer :sale_count, default: 0, comment: '总销量'
      t.integer :source_flag, default: 0, comment: ''
      t.integer :evaluate_count, default: 0, comment: '评估值'
      t.datetime :start_time, comment: '活动开始时间'
      t.datetime :valid_end_time, comment: '活动截止时间'
      t.integer :status, default: 0, comment: '状态'
      t.text :detail_info, comment: '详细信息'
      
      t.boolean :discover, default: false, comment: '是否为好商品'
      t.boolean :recommend, default: false, comment: '是否为推荐商品'
      
      t.belongs_to :business, comment: '公司信息', index: true
      t.belongs_to :adverts, optional: true, comment: '是否为广告商品'

      t.timestamps
    end

    add_index :goods, :uid, unique: true
    add_index :goods, :name, unique: true
    add_index :goods, :code, unique: true
  end
end
