class CreateGoodsSkus < ActiveRecord::Migration[5.1]
  def change
    # goods 与 skus 多对多关系中间表
    create_table :goods_skus do |t|
      t.belongs_to :good
      t.belongs_to :sku

      t.timestamps
    end
  end
end
