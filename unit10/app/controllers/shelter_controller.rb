class ShelterController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @pets = Pet.get_available_pets
  end
  def adopt
    @adopting = true
    @pets = Array.new
    @cart.selected_pets.each do |selected_pet|
      @pets.push(Pet.find(selected_pet.pet_id))
    end
  end
  def finish
    @cart.selected_pets.each do |selector|
      pet = Pet.find(selector.pet_id)
      pet.make_adopted
    end
    @cart.destroy if @cart.id == session[:cart_id]
    @pets = Pet.get_available_pets

    respond_to do |format|
      format.html { redirect_to shelter_index_url }
      format.json { head :no_content }
    end
  end
end
