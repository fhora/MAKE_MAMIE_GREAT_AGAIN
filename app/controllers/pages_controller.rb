class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def user
    @chatroom = Chatroom.new
    @user = User.find(params[:id])
    @review = Review.new
    @chatuser = @user.mission_candidates.joins(:mission).where(missions: { user: current_user }).select{ |candidate| candidate.chatrooms.empty? == true }
    @chatcurrentuser = current_user.mission_candidates.joins(:mission).where(missions: { user: @user }).select{ |candidate| candidate.chatrooms.empty? == true }
  end
end
