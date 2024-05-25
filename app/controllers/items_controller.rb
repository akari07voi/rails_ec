class ItemsController < ApplicationController
  def index
    @items = Item.all.order(:id)
  end

  def show
  end
end
