class StaticPagesController < ApplicationController
  def home
    @houses = House.all.order('created_at desc')
    @complex_buildings = ComplexBuilding.all.order('created_at desc')
    @commercial_units = CommercialUnit.all.order('created_at desc')
  end

  def about; end
end
