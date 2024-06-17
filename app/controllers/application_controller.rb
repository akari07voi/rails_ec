# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_cart

  private

  def current_cart
    @cart = Cart.find_or_create_by(id: session[:cart_id])
    @cart_items = @cart.cart_items
    session[:cart_id] = @cart.id
  end
end
