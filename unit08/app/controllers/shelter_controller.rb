class ShelterController < ApplicationController
  def index
    @pets = Pet.order(:pet_type).where(pet_status: "Available")
  end
end
