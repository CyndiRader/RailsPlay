class CreateSelectedPets < ActiveRecord::Migration
  def change
    create_table :selected_pets do |t|
      t.references :pet, index: true
      t.belongs_to :cart, index: true

      t.timestamps null: false
    end
    add_foreign_key :selected_pets, :pets
    add_foreign_key :selected_pets, :carts
  end
end
