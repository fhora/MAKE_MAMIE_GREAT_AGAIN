class MissionCandidatesController < ApplicationController
  def create
    @mission = Mission.find(params[:mission_id])
    @mission_candidate = MissionCandidate.new
    @mission_candidate.mission = @mission
    @mission_candidate.user = current_user
    authorize @mission_candidate
    if @mission_candidate.save
      redirect_to mission_path(@mission), notice: 'Vous avez apply'
    else
      redirect_to mission_path(@mission), alert: 'Erreur'
    end
  end

  def accepted
    @mission_candidate = MissionCandidate.find(params[:id])
    authorize @mission_candidate
    @mission = Mission.find(@mission_candidate.mission_id)

    if @mission_candidate.update(status: "Accepted")
      @mission.update(status: true)
      waiting_candidates = MissionCandidate.where("status LIKE 'waiting' AND mission_id = ?", @mission.id)
      decline_all_the_candidates(waiting_candidates)
      redirect_to mission_path(@mission_candidate)
    end
  end

  def declined
    @mission_candidate = MissionCandidate.find(params[:id])
    authorize @mission_candidate
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
