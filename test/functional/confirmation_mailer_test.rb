require 'test_helper'

class ConfirmationMailerTest < ActionMailer::TestCase
  test "confirm_shuttle" do
    mail = ConfirmationMailer.confirm_shuttle
    assert_equal "Confirm shuttle", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
