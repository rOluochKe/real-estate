class CreateComplexBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :complex_buildings do |t|
      t.string :owner
      t.string :address
      t.integer :units
      t.integer :sqmt
      t.decimal :price, precision: 5, scale: 2, default: 0

      t.timestamps
    end
  end
end
