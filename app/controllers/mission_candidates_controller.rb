class MissionCandidatesController < ApplicationController
  def create
    @mission_candidate = MissionCandidate.new
    @mission = Mission.find(params[:mission_id])
    @mission_candidate.mission = @mission
    @mission_candidate.user = current_user
    if @mission_candidate.save
      redirect_to mission_path(@mission), notice: 'Vous avez apply'
    else
      redirect_to mission_path(@mission), alert: 'Erreur'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
