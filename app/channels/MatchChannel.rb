class MatchChannel < ApplicationCable::Channel
  def subscribed
    stream_from "match:1"
    MatchChannel.broadcast_to(1, "Hello World")
    MatchChannel.broadcast_to(1, "Hello World")
  end

  def static_info
    MatchChannel.broadcast_to(1, "Hello World")
  end

  def dynamic_info
    # MatchChannel.broadcast_to(1, Match.find(params[:room]).dynamic_info)
  end


  def follow(data)
    # stop_all_streams
    # stream_from "match:list"
  end

  def unfollow
    # stop_all_streams
  end
end
