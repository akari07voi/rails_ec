# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
    before_action :basic_auth

    def index
      @items = Item.with_attached_image.order(:id)
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)

      if @item.save
        flash[:notice] = "商品名「#{@item.name}」を登録しました。"
        redirect_to admin_items_url
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        flash[:notice] = "商品名「#{@item.name}」を更新しました。"
        redirect_to admin_items_url
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      item = Item.find(params[:id])
      item.destroy
      flash[:notice] = "商品名「#{item.name}」を削除しました。"
      redirect_to admin_items_url
    end

    private

    def item_params
      params.require(:item).permit(:name, :price, :description, :image)
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |name, password|
        name == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
