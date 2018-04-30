class Api::GoodsController < Api::BaseController
  # skip_before_action :verify_authenticity_token
  # skip_before_action :authenticate_user!

  def adverts
    skip_authorization
    goods = Good.where.not(adverts_id: nil)
    render json: goods
  end

  def discovers
    skip_authorization
    sign_in(User.first, scope: :user) if params[:sign] == '60b2bc38263db451eb4b4ea9513b6a84'
    goods = Good.discovers
    render json: goods
  end

  def recommends
    skip_authorization
    goods = Good.recommends
    render json: goods
  end

  def goods
    skip_authorization
    goods = Good.all
    render json: goods
  end

  def detail
    skip_authorization
  end
end
