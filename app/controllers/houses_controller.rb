class HousesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_house, only: %i[show edit update destroy]

  # GET /houses or /houses.json
  def index
    @houses = House.all.order('created_at desc')
  end

  # GET /houses/1 or /houses/1.json
  def show; end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit; end

  # POST /houses or /houses.json
  def create
    @house = current_user.houses.new(house_params)

    if @house.save
      flash[:success] = 'House was successfully created.'
      redirect_to @house
    else
      render :new
    end
  end

  # PATCH/PUT /houses/1 or /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1 or /houses/1.json
  def destroy
    return unless current_user.id == @house.user_id

    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_house
    @house = House.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def house_params
    params.require(:house).permit(:image, :owner, :address, :rooms, :sqmt, :floors, :air_cond, :price, images: [])
  end
end
