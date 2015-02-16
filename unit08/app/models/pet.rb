class Pet < ActiveRecord::Base
  has_many :selected_pets
  before_destroy :ensure_not_selected
  enum pet_type: [ :dog, :cat ]
  validates :name, presence: true
  validates :description, presence: true, length: { in: 10..40 }

  private

  def ensure_not_selected
    if selected_pets.empty?
      return true
    else
      errors.add(:base, 'Pet has been selected')
      return false
    end
  end
end
