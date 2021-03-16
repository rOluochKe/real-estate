class AddImageToComplexBuildings < ActiveRecord::Migration[6.0]
  def change
    add_column :complex_buildings, :image, :string
  end
end
