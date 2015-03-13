class AddStatusToPets < ActiveRecord::Migration
  def change
    add_column :pets, :pet_status, :string, default: "Available", null: false
  end
end
