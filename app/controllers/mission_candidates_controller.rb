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

  def accepted
    @mission_candidate = MissionCandidate.find(params[:id])
    @mission = Mission.find(@mission_candidate.mission_id)
    @mission.mission_candidate_id = @mission_candidate.id
    @mission.save
    
    if @mission_candidate.update(status: "Accepted")
      waiting_candidates = MissionCandidate.where("status LIKE 'waiting' AND mission_id = ?", @mission.id)
      decline_all_the_candidates(waiting_candidates)
      redirect_to mission_path(@mission_candidate)
    end
  end

  def declined
    @mission_candidate = MissionCandidate.find(params[:id])
    @mission_candidate.update(status: "Declined")
    redirect_to mission_path(@mission_candidate)
  end

  private

  def mission_candidate_params
    params.require(:mission_candidate).permit(:status, :user_id, :mission_id)
  end

  def decline_all_the_candidates(array)
    array.each do |candidate|
      candidate.update(status: "Declined")
    end
  end
end
