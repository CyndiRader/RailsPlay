class ShelterController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @pets = Pet.order(:pet_type).where(pet_status: "Available")
  end
end
