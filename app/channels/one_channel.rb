class OneChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "one_channel"
    puts 'subscribed'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
