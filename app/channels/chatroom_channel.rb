class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end

  def unsubscribed
    chatroom = Chatroom.find(params[:id])
    messages = chatroom.messages.where.not(user: User.find(params[:user_id])).where(seen_date: nil)
    messages.update_all(seen_date: (Time.now - 3600).strftime("%d/%m/%Y %H:%M"))
    stop_stream_from chatroom
  end
end
