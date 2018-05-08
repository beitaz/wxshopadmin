class Api::GoodsController < Api::BaseController
  # skip_before_action :verify_authenticity_token
  # skip_before_action :authenticate_user!

  def adverts
    skip_authorization
    adverts = Advert.where(deleted: false).limit(6)
    unless adverts.empty?
      @result = {
        code: 0,
        list: adverts,
        reason: ''
      }
    end
    render json: @result
  end

  def discovers
    skip_authorization
    discovers = Discover.all
    if sign_verified?
      @result = {
        code: 0,
        list: discovers,
        reason: ''
      }
    end
    render json: @result
  end

  # GET hostGoodsList.json
  def recommends
    skip_authorization
    if sign_verified?
      recommends = Good.all.page(params[:page]).per(params[:size])
      @result = {
        code: 0,
        list: recommends,
        page_total: recommends.total_pages
      }
    end
    render json: @result
  end

  def goods
    skip_authorization
    goods = Good.all
    render json: goods
  end

  def info
    skip_authorization
    if sign_verified?
      good = Good.find(params[:id])
      now = Time.zone.now
      valid = good.start_time < now && good.valid_end_time > now
      @result = {
        code: 0,
        data: good,
        photos: good.photos,
        skus: good.skus,
        validDate: valid ? 1 : 0
      }
    end
    render json: @result
  end

  # 是否收藏
  def favorited
    skip_authorization
    if sign_verified
      visitor = Visitor.find_by(uid: params[:openid])
      # favorited = visitor.goods.include?(Good.find(params[:id]))
      @result = {
        code: 0,
        favorited: GoodVisitor.favorited?(visitor.id, params[:id])
      }
    end
    render json: @result
  end
end
