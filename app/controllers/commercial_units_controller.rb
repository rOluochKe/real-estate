class CommercialUnitsController < ApplicationController
  before_action :set_commercial_unit, only: %i[show edit update destroy]

  # GET /commercial_units or /commercial_units.json
  def index
    @commercial_units = CommercialUnit.all.order('created_at desc')
  end

  # GET /commercial_units/1 or /commercial_units/1.json
  def show; end

  # GET /commercial_units/new
  def new
    @commercial_unit = CommercialUnit.new
  end

  # GET /commercial_units/1/edit
  def edit; end

  # POST /commercial_units or /commercial_units.json
  def create
    @commercial_unit = current_user.commercial_units.new(commercial_unit_params)

    if @commercial_unit.save
      flash[:success] = 'Commercial Unit was successfully created.'
      redirect_to @commercial_unit
    else
      render :new
    end
  end

  # PATCH/PUT /commercial_units/1 or /commercial_units/1.json
  def update
    respond_to do |format|
      if @commercial_unit.update(commercial_unit_params)
        format.html { redirect_to @commercial_unit, notice: 'Commercial unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @commercial_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commercial_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commercial_units/1 or /commercial_units/1.json
  def destroy
    return unless current_user.id == @commercial_unit.user_id

    @commercial_unit.destroy
    respond_to do |format|
      format.html { redirect_to commercial_units_url, notice: 'Commercial unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_commercial_unit
    @commercial_unit = CommercialUnit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def commercial_unit_params
    params.require(:commercial_unit).permit(:image, :owner, :address, :shops, :sqmt, :parking, :price, images: [])
  end
end
