class OrdersController < ApplicationController
  def create
    @order = Order.new
    @order.build_user
    @order.user = User.new(user_params)
    @order.save!
    @order.user.save!
    bought_items_details = @cart.cart_items
    bought_items = bought_items_details.map do |bought_item_detail|
      OrderDetail.new(order_id: @order.id, name: bought_item_detail.item.name, description: bought_item_detail.item.description,
                      price: bought_item_detail.item.price)
    end

    OrderDetail.import bought_items
    binding.pry
    @cart.destroy
    flash[:notice] = '購入ありがとうございます。'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :firstname,
      :lastname,
      :username,
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
