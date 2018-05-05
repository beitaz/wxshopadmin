class CreateDiscovers < ActiveRecord::Migration[5.1]
  def change
    create_table :discovers do |t|
      t.string :code,                     comment: '编码'
      t.string :logo,                     comment: '图标'
      t.string :brand,                    comment: '品牌'
      t.string :brand_category,           comment: '品牌类型'
      t.string :season,                   comment: '年份季节'
      t.string :season_category,          comment: '季节类型'
      t.timestamps
    end
  end
end
