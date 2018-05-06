class SkusController < ApplicationController
  before_action :set_sku, only: [:show, :edit, :update, :destroy]

  # GET /skus
  # GET /skus.json
  def index
    skip_authorization
    respond_to do |format|
      format.html { @skus = Sku.all }
      format.json do
        @skus = Sku.where("name LIKE '%#{params[:term]}%'").page(params[:page]).per(ENV['PER_PAGE'])
        render json: {
          list: @skus,
          page_total: @skus.total_pages
        }
      end
    end
  end

  # GET /skus/1
  # GET /skus/1.json
  def show
    skip_authorization
  end

  # GET /skus/new
  def new
    skip_authorization
    @sku = params[:parent_id] ? Sku.new(parent_id: params[:parent_id]) : Sku.new
  end

  # GET /skus/new
  def base
    skip_authorization
    @sku = Sku.new(parent_id: 0)
    # render layout: false
  end

  # GET /skus/1/edit
  def edit
    skip_authorization
  end

  # POST /skus
  # POST /skus.json
  def create
    skip_authorization
    @sku = Sku.new(sku_params)

    respond_to do |format|
      if @sku.save
        format.html { redirect_to :skus, notice: "库存属性 '#{sku_name}' 已创建." }
        format.json { render :show, status: :created, location: @sku }
      else
        format.html { render :new }
        format.json { render json: @sku.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skus/1
  # PATCH/PUT /skus/1.json
  def update
    respond_to do |format|
      if @sku.update(sku_params)
        format.html { redirect_to @sku, notice: 'Sku was successfully updated.' }
        format.json { render :show, status: :ok, location: @sku }
      else
        format.html { render :edit }
        format.json { render json: @sku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skus/1
  # DELETE /skus/1.json
  def destroy
    skip_authorization
    @sku.destroy
    respond_to do |format|
      format.html { redirect_to skus_url, notice: "库存属性 '#{sku_name}' 已删除." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_sku
      @sku = Sku.find(params[:id])
    end

    def sku_name
      @sku.parent_id.zero? ? @sku.name : @sku.parent.name + @sku.name
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sku_params
      params.require(:sku).permit(:id, :parent_id, :name, :defaulted, :price, :sale_count,
                                  :stock_num, :stock_num_warn, :good_id)
    end
end
