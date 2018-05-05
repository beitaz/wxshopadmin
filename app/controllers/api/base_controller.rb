class Api::BaseController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_user!
  before_action :sign_verify#, except: [:debug, :adverts, :discovers, :recommends, :detail] 
  before_action :write_params, only: [:adverts, :discovers, :recommends, :detail]
  before_action :create_goods, only: :detail
  @result = {
    code: 10_001,
    reason: '数据获取失败'
  }

  def debug
    skip_authorization
    data = [{ hello: 'world!' }]
    render wx: wx(data)
  end

  def adverts
    skip_authorization
    puts action_name
  end

  def discovers
    skip_authorization
    puts action_name
  end

  def recommends
    skip_authorization
    puts action_name
  end

  def detail
    skip_authorization
    puts action_name
  end

  # 发送短信验证码
  def send_verify
    skip_authorization
    code = !Rails.env.development? ? 'ABCDEF' : SecureRandom.hex(3).upcase
    # 设置验证码 60s 后过期
    $redis.setex(params[:mobile], 60, code)
    render json: { code: code }
  end

  protected

    def sign_verify
      sign = params[:sign]
      time = params[:time]
      sign.present? && time.present? && Digest::MD5.hexdigest(time + ENV['SECRET_KEY']) == sign
    end

    def wx(data, code = '0', reason = '')
      # @TODO: data hash => array
      {
        code: code,
        reason: reason,
        time: Time.zone.now.to_formatted_s(:number),
        list: data
      }
    end

  private

    def write_params
      dir = Rails.root.join('tmp', 'data')
      Dir.mkdir(dir) unless Dir.exist?(dir)
      filename = (action_name == 'detail' ? params['code'] : action_name) + '.json'
      file_path = File.join(dir, filename)
      return if File.exist?(file_path)
      File.atomic_write(file_path) do |file|
        file.write(params.to_json)
      end
    end

    def create_goods
      good = params

      business = Business.find_or_create_by(uid: good['businessId']) do |b|
        b.brand_name = good['brandName']
        b.name = good['businessName']
      end

      Good.find_or_create_by(uid: params['id']) do |g|
        g.brand_name = business.brand_name
        g.business_id = business.id
        g.code = good['code']
        g.detail_info = good['detailInfo']
        g.evaluate_count = good['evaluateCount']
        g.free_ship_num = good['freeShipNum']
        g.freight = good['freight']
        g.logo = good['logo']
        g.market_price = good['marketPrice']
        g.min_buy_num = good['minBuyNum']
        g.name = good['name']
        g.price = good['price']
        g.sale_count = good['saleCount']
        g.share_amount = good['shareAmount']
        g.share_times = good['shareTimes']
        g.share_tips = good['shareTips']
        g.source_flag = good['sourceFlag']
        g.start_time = good['startTime']
        g.status = good['status']
        g.stock_num = good['stockNum']
        g.thum_logo = good['thumLogo']
        g.valid_end_time = good['validEndTime']
        g.whole_num = good['wholeNum']
        g.whole_price = good['wholePrice']
      end
    end
end
