class CreateGoodVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :good_visitors do |t|
      t.integer :visitor_id, :good_id, :category
    end

    add_index :good_visitors, [:visitor_id, :good_id, :category], unique: true
  end
end
