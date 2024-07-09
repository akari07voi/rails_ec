# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    @cart_detail = @cart_items.group(:item_id).count

    @items = Item.where(id: @cart_detail.keys)
    @all_price = @cart.sum_price
    @all_price -= @cart.promotion_code.educed_price if @cart.promotion_code.present?
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
    code_detail = PromotionCode.find_by(code: params[:code])
    @cart.build_cart_promotion_code(promotion_code_id: code_detail.id)
    @cart.cart_promotion_code.save
    redirect_to carts_path
  end

  def destroy
    destroy_item = @cart_items.where(item_id: params[:item_id])
    destroy_item.destroy_all
    redirect_to carts_path
  end
end
