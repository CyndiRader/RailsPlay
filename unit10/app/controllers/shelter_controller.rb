class ShelterController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @pets = Pet.get_available_pets
  end
end
