class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.references :parent, index: true, comment: '父类型'
      t.string :name, null: false, comment: '类型名称'

      t.timestamps
    end

    add_index :categories, [:parent_id, :name], unique: true
  end
end
