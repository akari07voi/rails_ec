# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_cart

  private

  def current_cart
    if session[:cart]
      session[:cart] = Cart.find_by(id: session[:cart]).id
      @cart_item = CartItem.where(cart_id: session[:cart])
    else
      session[:cart] = []
      cart = Cart.new(session_id: session.id)
      cart.save
      session[:cart] = cart.id
    end
  end
end
