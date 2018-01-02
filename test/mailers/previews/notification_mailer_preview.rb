# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/order_confirmation
  def order_confirmation
    NotificationMailer.order_confirmation
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/welcome_message
  def welcome_message
    NotificationMailer.welcome_message
  end

end
