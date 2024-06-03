# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.with_attached_image.order(:id)
  end

  def show
    @item = Item.with_attached_image.find(params[:id])
    @items = Item.with_attached_image.limit(4).where.not(id: params[:id]).order(created_at: :desc)
  end
end
