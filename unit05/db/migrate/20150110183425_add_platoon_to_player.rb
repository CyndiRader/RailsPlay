class AddPlatoonToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :platoon, :string
  end
end
