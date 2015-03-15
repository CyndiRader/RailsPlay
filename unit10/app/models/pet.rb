class Pet < ActiveRecord::Base
  has_many :selected_pets
  before_destroy :ensure_not_selected
  enum pet_type: [ :dog, :cat ]
  STATUS_TYPES = %w(Available Fostered Selected)
  validates :name, presence: true
  validates :description, presence: true, length: { in: 10..40 }

  def is_selected
    self.update(pet_status: 'Selected')
  end

  def make_available
    self.update(pet_status: 'Available')
  end

  def Pet.get_available_pets
    Pet.order(:pet_type).where(pet_status: 'Available')
  end

  private

  def ensure_not_selected
    if selected_pets.empty?
      true
    else
      errors.add(:base, 'Pet has already been selected')
      false
    end
  end
end
