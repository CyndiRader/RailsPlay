class SelectedPet < ActiveRecord::Base
  belongs_to :pet
  belongs_to :cart
  after_save :make_pet_unavailable
  before_destroy :make_pet_available

  private
  def make_pet_unavailable
    pet = Pet.find(pet_id)
    pet.is_selected
  end

  def make_pet_available
    pet = Pet.find(pet_id)
    pet.make_available unless pet.is_adopted?
  end
end
