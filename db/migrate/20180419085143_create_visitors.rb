class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.string :uid,                                default: ''
      t.string :email,                              default: ""
      t.string :nick_name,                          default: ""
      t.boolean :gender,                            default: false
      t.string :city,                               default: ""
      t.string :province,                           default: ""
      t.string :country,                            default: ""
      t.string :avatar_url,                         default: ""
      t.string :token,               null: false,   default: ""

      t.timestamps
    end

    add_index :visitors, :uid, unique: true
    add_index :visitors, :token, unique: true
  end
end
