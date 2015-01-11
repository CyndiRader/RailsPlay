class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :language
      t.integer :year
      t.integer :copies

      t.timestamps
    end
  end
end
