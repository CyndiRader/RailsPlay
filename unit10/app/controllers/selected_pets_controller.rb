class SelectedPetsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_selected_pet, only: [:show, :edit, :update, :destroy]

  # GET /selected_pets
  # GET /selected_pets.json
  def index
    @selected_pets = SelectedPet.all
  end

  # GET /selected_pets/1
  # GET /selected_pets/1.json
  def show
  end

  # GET /selected_pets/new
  def new
    @selected_pet = SelectedPet.new
  end

  # GET /selected_pets/1/edit
  def edit
  end

  # POST /selected_pets
  # POST /selected_pets.json
  def create
    pet = Pet.find(params[:pet_id])
    @selected_pet = @cart.selected_pets.build(pet: pet)

    respond_to do |format|
      if @selected_pet.save
        @pets = Pet.get_available_pets
        format.html { redirect_to shelter_index_url }
        format.js {}
        format.json { render :show, status: :created, location: @selected_pet }
      else
        format.html { render :new }
        format.json { render json: @selected_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selected_pets/1
  # PATCH/PUT /selected_pets/1.json
  def update
    respond_to do |format|
      if @selected_pet.update(selected_pet_params)
        format.html { redirect_to @selected_pet, notice: 'Selected pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @selected_pet }
      else
        format.html { render :edit }
        format.json { render json: @selected_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selected_pets/1
  # DELETE /selected_pets/1.json
  def destroy
    @selected_pet.destroy
     respond_to do |format|
      format.html { redirect_to shelter_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selected_pet
      @selected_pet = SelectedPet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selected_pet_params
      params.require(:selected_pet).permit(:pet_id)
    end
end
