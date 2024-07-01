# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    @order = Order.new
    @order.build_user
    @order.user = User.new(user_params)
    @order.user.save!
    bought_items_counts =  @cart.cart_items.group(:item_id).count
    bought_items_details = Item.where(id: bought_items_counts.keys)
    bought_items = bought_items_details.map do |bought_item_detail|
      @order.order_details.build(
        order_id: @order.id,
        name: bought_item_detail.name,
        description: bought_item_detail.description,
        price: bought_item_detail.price,
        quantity: bought_items_counts[bought_item_detail.id]
      )
    end
    OrderDetail.import bought_items
    UserMailer.with(order: @order).order_detail_email(order: @order).deliver_now
    @cart.destroy
    flash[:notice] = '購入ありがとうございます。'
  rescue StandardError => e
    flash[:alert] = '購入に失敗しました。'
  ensure
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :firstname,
      :lastname,
      :username,
      :email,
      :country,
      :state,
      :address,
      :address2,
      :zip,
      :cardname,
      :creditcardnumber,
      :expiration,
      :cvv
    )
  end
end
