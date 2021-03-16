class AddUserToComplexBuildings < ActiveRecord::Migration[6.0]
  def change
    add_reference :complex_buildings, :user, null: false, foreign_key: true
  end
end
