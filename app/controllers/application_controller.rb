# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_cart

  def current_cart
    session[:cart] = Cart.where(session_id: session[:session_id])
    @cart = session[:cart]
  end
end
