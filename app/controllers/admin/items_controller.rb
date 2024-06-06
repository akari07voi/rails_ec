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
    item = Item.new(item_params)
    item.save!
    redirect_to admin_items_url(@item), notice: "商品名「#{item.name}」を登録しました"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update!(item_params)
    redirect_to admin_items_url, notice: "商品名「#{item.name}」を更新しました"
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_url, notice: "商品名「#{item.name}」を削除しました"
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
