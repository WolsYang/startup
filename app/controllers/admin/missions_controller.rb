class Admin::MissionsController < ApplicationController
  layout 'admin'
  load_and_authorize_resource :mission, :user
  before_action :set_admin_mission, only: [:show, :edit, :update, :destroy]

  # GET /admin/missions
  # GET /admin/missions.json
  def index
    @admin_missions = Admin::Mission.all
  end

  # GET /admin/missions/1
  # GET /admin/missions/1.json
  def show
  end

  # GET /admin/missions/new
  def new
    @admin_mission = Admin::Mission.new
  end

  # GET /admin/missions/1/edit
  def edit
  end

  # POST /admin/missions
  # POST /admin/missions.json
  def create
    @admin_mission = Admin::Mission.new(admin_mission_params)

    respond_to do |format|
      if @admin_mission.save
        format.html { redirect_to @admin_mission, notice: 'Mission was successfully created.' }
        format.json { render :show, status: :created, location: @admin_mission }
      else
        format.html { render :new }
        format.json { render json: @admin_mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/missions/1
  # PATCH/PUT /admin/missions/1.json
  def update
    respond_to do |format|
      if @admin_mission.update(admin_mission_params)
        format.html { redirect_to @admin_mission, notice: 'Mission was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_mission }
      else
        format.html { render :edit }
        format.json { render json: @admin_mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/missions/1
  # DELETE /admin/missions/1.json
  def destroy
    @admin_mission.destroy
    respond_to do |format|
      format.html { redirect_to admin_missions_url, notice: 'Mission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_mission
      @admin_mission = Admin::Mission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_mission_params
      params.fetch(:admin_mission, {})
    end
end
