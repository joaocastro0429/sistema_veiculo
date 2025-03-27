class CreateVehicles < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicles do |t|
      t.string :model
      t.string :brand
      t.integer :year
      t.string :plate
      t.string :color

      t.timestamps
    end
  end
end
