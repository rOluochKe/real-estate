class ComplexBuildingsController < ApplicationController
  before_action :set_complex_building, only: %i[show edit update destroy]

  # GET /complex_buildings or /complex_buildings.json
  def index
    @complex_buildings = ComplexBuilding.all.order('created_at desc')
  end

  # GET /complex_buildings/1 or /complex_buildings/1.json
  def show; end

  # GET /complex_buildings/new
  def new
    @complex_building = ComplexBuilding.new
  end

  # GET /complex_buildings/1/edit
  def edit; end

  # POST /complex_buildings or /complex_buildings.json
  def create
    @complex_building = current_user.complex_buildings.new(complex_building_params)

    if @complex_building.save
      flash[:success] = 'Complex Building was successfully created.'
      redirect_to @complex_building
    else
      render :new
    end
  end

  # PATCH/PUT /complex_buildings/1 or /complex_buildings/1.json
  def update
    respond_to do |format|
      if @complex_building.update(complex_building_params)
        format.html { redirect_to @complex_building, notice: 'Complex building was successfully updated.' }
        format.json { render :show, status: :ok, location: @complex_building }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @complex_building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complex_buildings/1 or /complex_buildings/1.json
  def destroy
    return unless current_user.id == @complex_building.user_id

    @complex_building.destroy
    respond_to do |format|
      format.html { redirect_to complex_buildings_url, notice: 'Complex building was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_complex_building
    @complex_building = ComplexBuilding.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def complex_building_params
    params.require(:complex_building).permit(:image, :owner, :address, :units, :sqmt, :price, images: [])
  end
end
