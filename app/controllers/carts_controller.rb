# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    @cart_detail = @cart_items.group(:item_id).count

    @items = Item.where(id: @cart_detail.keys)
    @all_price = @cart.sum_price
    @all_price -= @cart.promotion_code.educed_price if @cart.promotion_code.present? && @cart.cart_items.size.positive?
    @order = Order.new
  end

  def new; end

  def create
    @item = Item.find(params[:item_id])
    add_count = params[:count] ? params[:count].to_i : 1
    add_cart_item = (1..add_count).map do
      @cart.cart_items.build(item_id: @item.id)
    end
    CartItem.import add_cart_item
    redirect_to root_path
  end

  def update
    code_detail = PromotionCode.find_by(code: params[:code], used_at: nil)

    if code_detail.nil?
      flash[:alert] = '入力されたコードはすでに使用済みか、正しくないコードです'
    else
      cart_used_code = CartPromotionCode.find_by(promotion_code_id: code_detail.id)
      if cart_used_code.present?
        flash[:alert] = '入力されたコードはすでに使用済みです'
      else
        @cart.build_cart_promotion_code(promotion_code_id: code_detail.id)
        @cart.cart_promotion_code.save
      end
    end
    redirect_to carts_path
  end

  def destroy
    destroy_item = @cart_items.where(item_id: params[:item_id])
    destroy_item.destroy_all
    redirect_to carts_path
  end
end
