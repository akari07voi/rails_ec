# frozen_string_literal: true

class OrderdetailsController < ApplicationController
  before_action :basic_auth

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_sum_price = @order.sum_price
    @order_sum_quantity = @order.sum_quantity
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
