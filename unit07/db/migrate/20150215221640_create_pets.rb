class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :age
      t.string :description

      t.timestamps null: false
    end
  end
end
