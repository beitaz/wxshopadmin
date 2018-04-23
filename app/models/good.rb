# == Schema Information
#
# Table name: goods
#
#  id                       :bigint(8)        not null, primary key
#  brand_name(品牌名称)         :string(255)      default("")
#  code(产品编码)               :string(255)      default("")
#  detail_info(详细信息)        :text(65535)
#  evaluate_count(评估值)      :integer          default(0)
#  free_ship_num(免运费数量)     :integer          default(0)
#  freight(运费)              :integer          default(0)
#  logo(图标)                 :string(255)      default("")
#  market_price(商城价)        :integer          default(0)
#  min_buy_num(最少购买数量)      :integer          default(0)
#  name(商品名称)               :string(255)      default("")
#  price((进货)价格)            :integer          default(0)
#  sale_count(已售)           :integer          default(0)
#  share_amount(分享合计)       :integer          default(0)
#  share_times(分享次数)        :integer          default(0)
#  share_tips(分享提示)         :string(255)      default("0")
#  source_flag              :integer          default(0)
#  start_time(活动开始时间)       :datetime
#  status(状态)               :integer          default(0)
#  stock_num(库存)            :integer          default(0)
#  thum_logo(大图标)           :string(255)      default("")
#  valid_end_time(活动截止时间)   :datetime
#  whole_num((享受分享价条件)分享次数) :integer          default(0)
#  whole_price(分享价)         :integer          default(0)
#  discover(是否为好商品)         :boolean          default(FALSE)
#  recommend(是否为推荐商品)       :boolean          default(FALSE)
#  business_id(公司信息)        :bigint(8)
#  adverts_id(是否为广告商品)      :bigint(8)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_goods_on_adverts_id   (adverts_id)
#  index_goods_on_business_id  (business_id)
#

class Good < ApplicationRecord
  has_many :photos
  belongs_to :business
  belongs_to :advert, optional: true
  has_and_belongs_to_many :skus

  # scope :adverts, -> { where.not(adverts_id: nil) }
  scope :discovers, -> { where(discover: true) }
  scope :recommends, -> { where(recommend: true) }
end