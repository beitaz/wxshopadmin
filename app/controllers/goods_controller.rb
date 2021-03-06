class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy]

  # GET /goods
  # GET /goods.json
  def index
    @goods = Good.all
    skip_authorization
  end

  # GET /goods
  # GET /goods.json
  def recommends
    skip_authorization
    @goods = Good.recommends
  end

  # GET /goods/1
  # GET /goods/1.json
  def show
    skip_authorization
  end

  # GET /goods/new
  def new
    skip_authorization
    @good = Good.new
    @sku = @good.skus.new
  end

  # GET /goods/1/edit
  def edit
    skip_authorization
  end

  # POST /goods
  # POST /goods.json
  def create
    @good = Good.new(good_params)

    respond_to do |format|
      if @good.save
        format.html { redirect_to :goods, notice: "已创建编号为 '#{@good.code}' 的商品." }
        format.json { render :show, status: :created, location: @good }
      else
        format.html { render :new }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goods/1
  # PATCH/PUT /goods/1.json
  def update
    skip_authorization
    respond_to do |format|
      if @good.update(good_params)
        format.html { redirect_to edit_good_path(@good), notice: "编号为 '#{@good.code}' 的商品已更新." }
        format.json { render :show, status: :ok, location: @good }
      else
        format.html { render :edit }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.json
  def destroy
    @good.destroy
    respond_to do |format|
      format.html { redirect_to goods_url, notice: 'Good was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_good
      @good = Good.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def good_params
      params.require(:good).permit(:id, :uid, :name, :title, :code, :brand_name, :logo, :thum_logo,
                                   :stock_num, :price, :market_price, :whole_price, :whole_num, :share_tips,
                                   :share_times, :share_amount, :min_buy_num, :free_ship_num, :freight,
                                   :sale_count, :source_flag, :evaluate_count, :start_time, :valid_end_time,
                                   :status, :detail_info, :discover, :recommend, :business_id, :adverts_id,
                                   skus_attributes: [:id, :name, :defaulted, :price, :sale_count, :category_id,
                                                     :stock_num, :stock_num_warn, :_destroy])
    end
end
