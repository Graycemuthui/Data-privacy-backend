class Api::V1::FacilitiesController < ApplicationController
  skip_before_action :authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /facilities or /facilities.json
  def index
    @facilities = Facility.all
    render.json: @facilities
  end

  # GET /facilities/1 or /facilities/1.json
  def show
    @facility = Facility.find(params[:id])
    render json: @facility
  end

  # GET /facilities/new
  def new
    @facility = Facility.new
  end

  # GET /facilities/1/edit
  def edit; end

  # POST /facilities or /facilities.json
  def create
    @facility = Facility.new(facility_params)

    respond_to do |format|
      if @facility.save
        format.html { redirect_to facility_url(@facility), notice: 'Facility was successfully created.' }
        format.json { render :show, status: :created, location: @facility }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facilities/1 or /facilities/1.json
  def update
    respond_to do |format|
      if @facility.update(facility_params)
        format.html { redirect_to facility_url(@facility), notice: 'Facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @facility }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilities/1 or /facilities/1.json
  def destroy
    @facility.destroy

    respond_to do |format|
      format.html { redirect_to facilities_url, notice: 'Facility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_facility
    @facility = Facility.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def facility_params
    params.require(:facility).permit(:facility_name, :facility_phone_number, :facility_location, :facility_description)
  end
end
