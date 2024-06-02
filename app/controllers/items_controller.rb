# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all.order(:id)
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.limit(4).order(created_at: :desc)
  end
end
