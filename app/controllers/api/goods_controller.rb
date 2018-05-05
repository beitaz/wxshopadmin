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
    if sign_verify
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
    # {"p"=>"1", "size"=>"10", "cateCode"=>"021", "sort"=>"1", "skuval"=>"", "sign"=>"8ba2129c77f22fab7032ba5263090976", "time"=>"20180504093512"}
    if sign_verify
      recommends = Good.recommends
      # recommends.offset((params[:p].to_i - 1) * params[:size])
      @result = {
        code: 0,
        list: recommends,
        reason: ''
      }
    end
    render json: @result
  end

  def goods
    skip_authorization
    goods = Good.all
    render json: goods
  end

  def show
    skip_authorization
    if sign_verify
      good = Good.find(params[:id])
      now = Time.zone.now
      valid = good.start_time < now && good.valid_end_time > now
      @result = {
        code: 0,
        data: good,
        photos: good.photos,
        validDate: valid ? 1 : 0
      }
    end
    render json: @result
  end

  # 是否收藏
  def favorited
    skip_authorization
    if sign_verify
      visitor = Visitor.find_by(uid: params[:openid])
      # favorited = visitor.goods.include?(Good.find(params[:id]))
      @result = {
        code: 0,
        favorited: GoodVisitor.favorited?(visitor.id, params[:id])
      }
    end
    render json: @result
  end

  # 添加收藏
  def favorite
    skip_authorization
    if sign_verify
      visitor = Visitor.find_by(uid: params[:openid])
      # good = Good.find(params[:id])
      # GoodVisitor.find_or_create_by(visitor_id: visitor.id, good_id: good.id, category: 2)
      GoodVisitor.favorite(visitor.id, params[:id])
      @result = {
        code: 0,
        msg: '收藏成功!'
      }
    end
    render json: @result
  end

  # 取消收藏
  def cancel
    skip_authorization
    if sign_verify
      visitor = Visitor.find_by(uid: params[:openid])
      # canceled = visitor.goods.delete(Good.find(params[:id]))
      # gv = GoodVisitor.find_by(visitor_id: visitor.id, good_id: params[:id], category: 2)
      @result = {
        code: 0,
        canceled: GoodVisitor.unfavorite(visitor.id, params[:id]),
        msg: '取消收藏!'
      }
    end
    render json: @result
  end
end
