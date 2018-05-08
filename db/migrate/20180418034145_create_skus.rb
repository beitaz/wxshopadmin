class CreateSkus < ActiveRecord::Migration[5.1]
  def change
    create_table :skus do |t|
      t.string :name, index: true, comment: '库存属性'
      t.boolean :defaulted, default: false
      t.integer :price, default: 0, comment: '商品价格(同种商品不同型号价格可能不同)'
      t.integer :sale_count, default: 0, comment: '已售'
      # t.string :sku_name_ids, default: '', comment: '库存属性 ID("[1446,1447]")'
      # t.string :sku_names, default: '', comment: '库存属性名称("[\"颜色\",\"尺码\"]")'
      # t.string :sku_val_ids, default: '', comment: '库存属性值ID("[3562,3563]")'
      # t.string :sku_vals, default: '', comment: '库存属性值("[\"图片色\",\"S\"]")'
      t.integer :stock_num, default: 0, comment: '库存'
      t.integer :stock_num_warn, default: 0, comment: '库存警戒'
      
      t.belongs_to :category, index: true, comment: '所属类型'
      t.belongs_to :good, index: true, comment: '商品'

      t.timestamps
    end

    add_index :skus, [:category_id, :good_id], unique: true
  end
end
