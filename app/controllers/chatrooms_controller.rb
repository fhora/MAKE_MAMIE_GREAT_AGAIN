class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
    @message = Message.new
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @name = current_user == @chatroom.user ? @chatroom.mission_candidate.user.fullname : @chatroom.user.fullname
    authorize @chatroom
  end

  def create
    mission_candidate = MissionCandidate.find(params[:chatroom][:mission_candidate_id])
    @chatroom = Chatroom.new
    @chatroom.mission_candidate = mission_candidate
    @chatroom.user = mission_candidate.mission.user
    authorize @chatroom
    @chatroom.save!
    redirect_to chatroom_path(@chatroom)
  end
end
