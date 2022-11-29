class MissionsController < ApplicationController
  before_action :set_mission, only: %i[show edit update destroy]

  def index
    @missions = Mission.all.select { |mission| mission.mission_candidate_id.nil? }
  end

  def show
    @mission = Mission.find(params[:id])
    @mission_candidates = MissionCandidate.all.select { |mission_candidate| mission_candidate.mission == @mission }
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    if @mission.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])
    if @mission.update(mission_params)
      redirect_to dashboard_path
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.delete
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(:title, :description, :reward_cents, :location, :start_date, :end_date)
  end
end
