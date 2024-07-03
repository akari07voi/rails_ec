# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    @cart_detail = @cart_items.group(:item_id).count

    @items = Item.where(id: @cart_detail.keys)
    @all_price = 0
    @cart_items.each do |cart_item|
      @all_price += cart_item.item.price
    end
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

  def destroy
    destroy_item = @cart_items.where(item_id: params[:item_id])
    destroy_item.destroy_all
    redirect_to carts_path
  end
end
