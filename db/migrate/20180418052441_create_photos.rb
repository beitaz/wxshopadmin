class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    # 图片
    create_table :photos do |t|
      # t.attachment :photo, comment: '图片'
      # t.attachment :thum_photo, comment: '缩略图'
      t.string :photo, comment: '图片'
      t.string :thum_photo, comment: '缩略图'

      t.belongs_to :good
      t.timestamps
    end
  end
end
