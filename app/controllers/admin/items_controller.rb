class Admin::ItemsController < ApplicationController
  helper_method :current_user
  before_action :login_required

  def index
    @items = Item.with_attached_image.order(:id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "商品名「#{@item.name}」を登録しました。"
      redirect_to admin_items_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品名「#{@item.name}」を更新しました。"
      redirect_to admin_items_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    flash[:notice] = "商品名「#{item.name}」を削除しました。"
    redirect_to admin_items_url
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :image)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to admin_login_path unless current_user
  end
end
