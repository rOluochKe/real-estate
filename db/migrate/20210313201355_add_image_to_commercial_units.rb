class AddImageToCommercialUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :commercial_units, :image, :string
  end
end
