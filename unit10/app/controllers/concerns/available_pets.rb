module AvailablePets
  extend ActiveSupport::Concern

  private

  def set_available_pets
    @pets = Pet.order(:pet_type).where(pet_status: "Available")
  end
end