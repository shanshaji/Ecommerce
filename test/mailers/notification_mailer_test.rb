require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "order_confirmation" do
    mail = NotificationMailer.order_confirmation
    assert_equal "Order confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "welcome_message" do
    mail = NotificationMailer.welcome_message
    assert_equal "Welcome message", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
