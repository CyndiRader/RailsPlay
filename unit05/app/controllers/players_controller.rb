class PlayersController < ApplicationController
  before_action :set_team
  before_action :set_player, only: [:show, :edit, :update, :destroy, :index]

  # GET /players
  # GET /players.json
  def index
    #@players = Player.order(platoon: :desc, jersey: :asc)
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])
  end

  # GET /players/new
  def new
    @player = @team.players.build
  end

  # GET /players/1/edit
  def edit
    #@team = Team.find(params[:team_id])
    #@player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.json
  def create
    @player = @team.players.build(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to team_path(@team), notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to team_player_path(@team, @player), notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to team_path(@team), notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
        @players = @team.players
        @player = Player.find(params[:id])
    end

    def set_team
      @team = Team.find(params[:team_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:first_name, :last_name, :jersey, :platoon)
    end
end
