class ShelterController < ApplicationController
  def index
    @pets = Pet.order(:pet_type)
  end
end
