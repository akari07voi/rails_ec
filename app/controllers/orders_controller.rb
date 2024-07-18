# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    @order = Order.new
    @order.user = User.new(user_params)
    @order.save
    bought_items = @order.bought_items(@cart)
    OrderDetail.import bought_items
    UserMailer.with(order: @order).order_detail_email(@order, @cart).deliver_now
    @cart.promotion_code.update(used_at: Time.zone.now, order_id: @order.id) if @cart.promotion_code.present?
    @cart.destroy
    redirect_to root_path, notice: '購入ありがとうございます'
  rescue StandardError
    redirect_to root_path, alert: '購入に失敗しました'
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
