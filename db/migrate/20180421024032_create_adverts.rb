class CreateAdverts < ActiveRecord::Migration[5.1]
  def change
    create_table :adverts do |t|
      t.string :title,                      default: '',     comment: '广告标题'
      t.string :pic_url,                    default: '',     comment: '广告图片'
      t.string :advert_url,                 default: '',     comment: '广告地址'
      t.string :promo_pic_url,              default: '',     comment: '推广图片'
      t.string :promo_tips,                 default: '',     comment: '推广提示'
      t.string :promo_desc,                 default: '',     comment: '推广描述'
      t.integer :type,                      default: 0,      comment: '广告类型'
      t.integer :sort,                      default: 0,      comment: '显示顺序'
      t.integer :status,                    default: 0,      comment: '状态'
      t.integer :present_amout,             default: 0,      comment: ''
      t.integer :limit_fowards,             default: 0,      comment: ''
      t.integer :limit_price,               default: 0,      comment: ''
      t.integer :location_flag,             default: 0,      comment: ''
      t.boolean :isdeleted,                 default: false,  comment: '标记删除'

      t.timestamps
    end
  end
end
