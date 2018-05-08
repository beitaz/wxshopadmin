class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name, index: true

      t.integer :resource_id
      t.string :resource_type

      t.timestamps
    end

    add_index :resources, [:resource_id, :resource_type]
  end
end
