class UsersController < ApplicationController
  before_action :set_user, only: [:show, :profile, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    authorize @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize @user
  end

  # GET /users/current_user_id
  # GET /users/current_user_id.json
  def profile
    @user = current_user
    authorize @user
  end

  # GET /users/new
  def new
    @user = User.new
    authorize @user
  end

  # GET /users/1/edit
  def edit
    skip_authorization
  end

  # POST /users
  # POST /users.json
  def create
    authorize User
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "用户 #{@user.uname} 创建成功." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "用户 #{@user.uname} 更新成功." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize current_user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "用户 #{@user.uname} 已删除." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:uname, :name, :email, :password, :password_confirmation, :remember_me, :avatar)
    end
end
