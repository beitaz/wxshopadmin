class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    # 公司信息
    create_table :businesses do |t|
      t.string :name, default: '', comment: '公司名称'
      t.string :brand_name, default: '', comment: '品牌名称'

      t.timestamps
    end
  end
end
