# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180421024032) do

  create_table "adverts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", default: "", comment: "广告标题"
    t.string "pic_url", default: "", comment: "广告图片"
    t.string "advert_url", default: "", comment: "广告地址"
    t.string "promo_pic_url", default: "", comment: "推广图片"
    t.string "promo_tips", default: "", comment: "推广提示"
    t.string "promo_desc", default: "", comment: "推广描述"
    t.integer "type", default: 0, comment: "广告类型"
    t.integer "sort", default: 0, comment: "显示顺序"
    t.integer "status", default: 0, comment: "状态"
    t.integer "present_amout", default: 0
    t.integer "limit_fowards", default: 0
    t.integer "limit_price", default: 0
    t.integer "location_flag", default: 0
    t.boolean "isdeleted", default: false, comment: "标记删除"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "businesses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", comment: "公司名称"
    t.string "brand_name", default: "", comment: "品牌名称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "brand_name", default: "", comment: "品牌名称"
    t.string "code", default: "", comment: "产品编码"
    t.text "detail_info", comment: "详细信息"
    t.integer "evaluate_count", default: 0, comment: "评估值"
    t.integer "free_ship_num", default: 0, comment: "免运费数量"
    t.integer "freight", default: 0, comment: "运费"
    t.string "logo", default: "", comment: "图标"
    t.integer "market_price", default: 0, comment: "商城价"
    t.integer "min_buy_num", default: 0, comment: "最少购买数量"
    t.string "name", default: "", comment: "商品名称"
    t.integer "price", default: 0, comment: "(进货)价格"
    t.integer "sale_count", default: 0, comment: "已售"
    t.integer "share_amount", default: 0, comment: "分享合计"
    t.integer "share_times", default: 0, comment: "分享次数"
    t.string "share_tips", default: "0", comment: "分享提示"
    t.integer "source_flag", default: 0
    t.datetime "start_time", comment: "活动开始时间"
    t.integer "status", default: 0, comment: "状态"
    t.integer "stock_num", default: 0, comment: "库存"
    t.string "thum_logo", default: "", comment: "大图标"
    t.datetime "valid_end_time", comment: "活动截止时间"
    t.integer "whole_num", default: 0, comment: "(享受分享价条件)分享次数"
    t.integer "whole_price", default: 0, comment: "分享价"
    t.boolean "discover", default: false, comment: "是否为好商品"
    t.boolean "recommend", default: false, comment: "是否为推荐商品"
    t.bigint "business_id", comment: "公司信息"
    t.bigint "adverts_id", comment: "是否为广告商品"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adverts_id"], name: "index_goods_on_adverts_id"
    t.index ["business_id"], name: "index_goods_on_business_id"
  end

  create_table "goods_skus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "good_id"
    t.bigint "sku_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_id"], name: "index_goods_skus_on_good_id"
    t.index ["sku_id"], name: "index_goods_skus_on_sku_id"
  end

  create_table "photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "photo_file_name", comment: "图片"
    t.string "photo_content_type", comment: "图片"
    t.integer "photo_file_size", comment: "图片"
    t.datetime "photo_updated_at", comment: "图片"
    t.string "thum_photo_file_name", comment: "图片"
    t.string "thum_photo_content_type", comment: "图片"
    t.integer "thum_photo_file_size", comment: "图片"
    t.datetime "thum_photo_updated_at", comment: "图片"
    t.bigint "good_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_id"], name: "index_photos_on_good_id"
  end

  create_table "skus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "price", default: 0, comment: "商品价格(同种商品不同型号价格可能不同)"
    t.integer "sale_count", default: 0, comment: "已售"
    t.string "sku_name_ids", default: "", comment: "库存属性 ID(\"[1446,1447]\")"
    t.string "sku_names", default: "", comment: "库存属性名称(\"[\\\"颜色\\\",\\\"尺码\\\"]\")"
    t.string "sku_val_ids", default: "", comment: "库存属性值ID(\"[3562,3563]\")"
    t.string "sku_vals", default: "", comment: "库存属性值(\"[\\\"图片色\\\",\\\"S\\\"]\")"
    t.integer "stock_num", default: 0, comment: "库存"
    t.integer "stock_num_warn", default: 0, comment: "库存警戒"
    t.bigint "goods_id", comment: "商品"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goods_id"], name: "index_skus_on_goods_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: ""
    t.string "uname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uname"], name: "index_users_on_uname", unique: true
  end

  create_table "visitors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "uid", default: ""
    t.string "email", default: ""
    t.string "nick_name", default: ""
    t.boolean "gender", default: false
    t.string "city", default: ""
    t.string "province", default: ""
    t.string "country", default: ""
    t.string "avatar_url", default: ""
    t.string "token", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_visitors_on_token", unique: true
    t.index ["uid"], name: "index_visitors_on_uid", unique: true
  end

end
