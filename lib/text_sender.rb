class TextSender
  # https://www.twilio.com/blog/2012/02/adding-twilio-sms-messaging-to-your-rails-app.html
  # https://www.twilio.com/blog/2014/10/twilio-on-rails-part-2-rails-4-app-sending-sms-mms.html

  def deliver(body, phone_number)
    message.create(
      from: ENV["SUBSCRIBE_PHONE_NUMBER"],
      to: phone_number,
      body: body
    )
  end

  private

  def client
    twilio_sid = ENV["TWILIO_SID"]
    twilio_token = ENV["TWILIO_TOKEN"]

    @_client ||= Twilio::REST::Client.new(twilio_sid, twilio_token)
  end

  def message
    client.messages
  end
end