# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def order_detail_email(order:)
    @order = order
    mail(to: @order.user.email, subject: '購入完了のお知らせ')
  end
end
