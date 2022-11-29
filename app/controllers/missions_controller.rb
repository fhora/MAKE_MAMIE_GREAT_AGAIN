class MissionsController < ApplicationController
  before_action :set_mission, only: %i[show edit update destroy]

  def index
    @missions = policy_scope(Mission)
  end

  def show
    @mission = Mission.find(params[:id])
    authorize @mission
    @mission_candidate = MissionCandidate.new(mission: @mission)
    @mission_candidates = MissionCandidate.where(mission: @mission)
  end

  def new
    @mission = Mission.new
    authorize @mission
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    authorize @mission
    if @mission.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @mission = Mission.find(params[:id])
    authorize @mission
  end

  def update
    @mission = Mission.find(params[:id])
    authorize @mission
    if @mission.update(mission_params)
      redirect_to dashboard_path
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    authorize @mission
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
