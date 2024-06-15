# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_cart

  private

  def current_cart
    session[:cart] = Cart.where(session_id: session[:session_id])
    @cart = session[:cart]
  end
end
