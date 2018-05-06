class CreateSkus < ActiveRecord::Migration[5.1]
  def change
    create_table :skus do |t|
      t.references :parent, comment: '自连接'
      t.string :name, comment: '库存属性'
      t.boolean :defaulted, default: false
      t.integer :price, default: 0, comment: '商品价格(同种商品不同型号价格可能不同)'
      t.integer :sale_count, default: 0, comment: '已售'
      # t.string :sku_name_ids, default: '', comment: '库存属性 ID("[1446,1447]")'
      # t.string :sku_names, default: '', comment: '库存属性名称("[\"颜色\",\"尺码\"]")'
      # t.string :sku_val_ids, default: '', comment: '库存属性值ID("[3562,3563]")'
      # t.string :sku_vals, default: '', comment: '库存属性值("[\"图片色\",\"S\"]")'
      t.integer :stock_num, default: 0, comment: '库存'
      t.integer :stock_num_warn, default: 0, comment: '库存警戒'

      t.references :good, comment: '商品'

      t.timestamps
    end

    add_index :skus, [:parent_id, :name], unique: true

    # goods 与 skus 多对多关系中间表
    create_table :goods_skus, id: false do |t|
      t.belongs_to :good
      t.belongs_to :sku
    end
    add_index :goods_skus, [:good_id, :sku_id], unique: true
  end
end
