class MissionCandidateController < ApplicationController
  def create
    @mission = Mission.find(params[:id])
    @mission_candidate = MissionCandidate.new(user: current_user, mission: @mission)
    @mission_candidate.save
    redirect_to mission_path(@mission)
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
