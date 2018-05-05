class Api::UsersController < Api::BaseController
  # skip_before_action :authenticate_user!

  # 绑定手机号
  def register
    skip_authorization
    result = {
      code: 10_001,
      msg: '验证码错误!'
    }
    verify_code = $redis.get(params[:mobile])
    if verify_code == params[:verification_code]
      Visitor.update_all(mobile: params[:mobile], openid: params[:openid])
      result[:code] = 0
      result[:msg] = '绑定成功'
    end
    render json: result
  end

  # "我"(用户信息)
  def info
    skip_authorization
    render json: Visitor.find_by(openid: params[:openid])
  end

  # 我的订单
  def orders
    skip_authorization
    result = {
      code: 10_001,
      msg: '订单获取失败'
    }
    orders = Order.where(visitor_id: params[:openid], status: params[:order_status], category: params[:type])
    result[:list] = orders
    result[:code] = 0
    result[:total_count] = orders.size
    result[:page_total] = (result[:total_count] / params[:size].to_i).ceil
    result[:msg] = '订单已获取'
    render json: result
  end

  # 我的足迹
  def browses
    skip_authorization
    if sign_verify
      visitor = Visitor.find_by(uid: params[:openid])
      gvs = GoodVisitor.where(visitor_id: visitor.id, category: 1)
      favorites = Good.where(id: gvs.map(&:good_id))
      list = favorites.page(params[:page]).per(params[:size])
      @result = {
        code: 0,
        list: list,
        page_total: list.total_pages,
        msg: '已获取收藏'
      }
    end
    render json: @result
  end

  # 添加用户足迹
  def browsed
    skip_authorization
    if sign_verify
      visitor = Visitor.find_by(uid: params[:openid])
      GoodVisitor.visit(visitor.id, params[:id])
      @result = {
        code: 0,
        msg: '足迹已保存'
      }
    end
    render json: @result
  end

  # 我的收藏
  def favorites
    skip_authorization
    if sign_verify
      # Visitor.joins(:good_visitors).where('good_visitors.category = ?', 2)
      # Good.joins(:good_visitors).where('good_visitors.category = ? AND good_visitors.visitor_id = ?', 2, visitor.id)
      # select g.* from goods as g where g.id in (select gv.good_id from good_visitors as gv inner join visitors as v where gv.visitor_id = v.id and gv.category = 2);
      visitor = Visitor.find_by(uid: params[:openid])
      favorites = GoodVisitor.favorites(visitor.id)
      list = favorites.offset((params[:page].to_i - 1) * params[:size].to_i)
      page_total = (favorites.size / params[:size].to_i).ceil
      @result = {
        code: 0,
        list: list,
        page_total: page_total,
        msg: '已获取收藏'
      }
    end
    render json: @result
  end

  # 添加收藏
  def favorited
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
  def unfavorite
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

  # 加入购物车
  def shopcart
    skip_authorization
    # "openid"=>"oNWgu5Wm1C1UxLDU1dpPr-H58qQQ", "id"=>"1", "goods_sku_id"=>"undefined", "purchase_type"=>"1", "num"=>"1", "sign"=>"95961eface0d8cbbfc1a328685e3a9bc", "time"=>"20180505173351"}
    debugger
    if sign_verify
      good = Good.find(params[:id])
    end
  end
end
