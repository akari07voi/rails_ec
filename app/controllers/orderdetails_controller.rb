# frozen_string_literal: true

class OrderdetailsController < ApplicationController
  before_action :basic_auth

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    @order_sum_price = 0
    @order_sum_quantity = 0
    @order_details.each do |order_detail|
      @order_sum_price += (order_detail.quantity * order_detail.price)
      @order_sum_quantity += order_detail.quantity
    end
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
