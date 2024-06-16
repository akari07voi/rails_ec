# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    session[:cart_detail] =
      CartItem.where(cart_id: session[:cart]).group(:item_id).count
    @cart_detail = session[:cart_detail]
    return if @cart_detail.nil?

    @items = Item.where(id: @cart_detail.keys)
    @all_price = 0
    @items.each do |item|
      @all_price += item.price * @cart_detail[item.id]
    end
  end

  def new; end

  def create
    @item = Item.find(params[:item_id])
    add_cart_item = []
    add_count = params[:count] ? params[:count].to_i : 1
    (1..add_count).each do
      add_cart_item << CartItem.new(item_id: @item.id, cart_id: session[:cart])
    end
    CartItem.import add_cart_item
    redirect_to root_path
  end

  def destroy
    destroy_item = CartItem.where(cart_id: session[:cart], item_id: params[:item_id])
    destroy_item.destroy_all
    redirect_to carts_path
  end
end
