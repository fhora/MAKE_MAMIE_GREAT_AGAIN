class MissionsController < ApplicationController
  before_action :set_mission, only: %i[show edit update destroy]

  def index
    if params[:query].present?

      # split la query par espace et chaine la requete pour chaque item dans l'array ???

      @missions = policy_scope(Mission).search_by_title(params[:query])
    else
      @missions = policy_scope(Mission)
    end
    respond_to do |format|
      format.html
      format.text { render partial: "missions/list", locals: { missions: @missions }, formats: [:html] }
    end
  end

  def show
    @chatroom = Chatroom.new
    authorize @mission
    @mission_candidate = MissionCandidate.new(mission: @mission)
    @mission_candidates = MissionCandidate.where(mission: @mission)
    @accepted_candidate = @mission.mission_candidates.accepted.first if @mission.status == true
    @waiting_candidates = @mission.mission_candidates.waiting if policy(@mission).destroy?
    @markers =
      [{
        lat: @mission.latitude,
        lng: @mission.longitude
      }]
  end

  def new
    @mission = Mission.new
    authorize @mission
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    @mission.reward_cents *= 100
    @mission.category_list = params[:mission][:categories]
    authorize @mission
    if @mission.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @mission
  end

  def update
    authorize @mission
    if @mission.update(mission_params)
      redirect_to dashboard_path
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    authorize @mission
    @mission.destroy
    redirect_to dashboard_path
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(:title, :description, :reward_cents, :location, :start_date, :categories)
  end
end
