# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    session[:cart_detail] =
      Cart.where(session_id: session[:session_id]).group(:item_id).count
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
    add_cart = []
    add_count = params[:count] ? params[:count].to_i : 1
    (1..add_count).each do
      add_item_param = Cart.new(item_id: params[:item_id], session_id: session[:session_id])
      add_cart << add_item_param
    end
    Cart.import add_cart
    redirect_to root_path
  end

  def destroy
    cart = Cart.where(item_id: params[:item_id], session_id: session[:session_id])
    cart.destroy_all
    redirect_to carts_path
  end
end
