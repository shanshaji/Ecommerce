class NotificationMailer < ApplicationMailer

  
  def order_confirmation(order)
    @order = order

    mail to: "#{order.user.email}", subject: "Your order has been confirmed - #{order.order_number}"
  end

  
  def welcome_message
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
